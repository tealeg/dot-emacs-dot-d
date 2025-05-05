;;;; basics

(setq inhibit-startup-screen t)
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(if (eq system-type 'darwin)
    (setq mail-host-address "upvest.co"
	  user-mail-address "geoffrey@upvest.co")
  (setq mail-host-address "teale.de"
	user-mail-address "geoffrey@teale.de"))

(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier nil))
(if (eq system-type 'haiku)
    (progn 
      (add-to-list 'load-path "~/config/settings/emacs/lisp")
      (setq custom-file "~/config/settings/emacs/custom.el"))
  (progn
    (add-to-list 'load-path "~/.config/emacs/lisp")
    (setq custom-file "~/.config/emacs/custom.el")))


;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; Fix linum
(use-package nlinum
  :ensure t
  :config
  (defun linum-mode (arg)
    (interactive "P")
    (nlinum-mode arg))
  )

;; Spelling

(use-package flyspell
  :ensure t
  :config
  (require 'ispell)
  (setq ispell-dictionary "en_GB"))



;; Org-mode
(use-package org
  :ensure t
  :init
  (require 'org-agenda)
  (require 'org-habit)
  :config
  (setq org-todo-keywords (list "TODO" "IN-PROGRESS" "|" "DONE" "CANCELED")
	org-log-done 'time
	org-log-into-drawer t
	org-agenda-files '("todo.org" "habits.org" "completed.org")

	;; Edit settings
	org-auto-align-tags nil
	org-tags-column 0
	org-catch-invisible-edits 'show-and-error
	org-special-ctrl-a/e t
	org-insert-heading-respect-content t
	
	;; Org styling, hide markup etc.
	org-hide-emphasis-markers t
	org-pretty-entities t
	org-agenda-tags-column 0
	org-ellipsis "…")


  (defun tealeg--org-mode-helper-f ()
    ;; (org-modern-mode 1)
    (flyspell-mode 1)
    )
  
  (add-hook 'org-mode-hook #'tealeg--org-mode-helper-f)


  (defun tealeg--is-file-modified (fname)
    (when (magit-run-git "status" "--porcelain" fname)
      (string-prefix-p "M" (string-trim
			    (save-excursion
			      (with-current-buffer (magit-process-buffer)
				(end-of-buffer)
				(set-mark (point-max))
				(beginning-of-line)
				(while (and (not (string-prefix-p "  0" (buffer-substring (point) (mark))))
					    (not (= (point) (point-min))))
				  (previous-line))
				(if (string-prefix-p "  0" (buffer-substring (point) (mark)))
				    (progn
				      (next-line)
				      (beginning-of-line)
				      (set-mark (point))
				      (end-of-line)
				      (buffer-substring (mark) (point)))
				  "")))))))
  
  

  (defun tealeg--org-commit-and-push-todos ()
    (interactive)
    (require 'magit)
    (require 'magit-process)

    (let ((modified nil))
      (dolist (fname org-agenda-files modified)
	(save-buffer (get-buffer fname))
	(when (tealeg--is-file-modified fname)
	  (magit-run-git "add" fname)
	  (setq modified t)))
      (when modified
	(magit-run-git "commit" "-m" (concat "'Update TODOs " (current-time-string) "'"))
	(magit-run-git-with-editor "pull" "-r" "origin" "main")
	(magit-run-git "push" "origin" "main"))))
  
  (defun tealeg--todo-save-helper-f ()
    (interactive)
    (let ((bname (buffer-file-name (current-buffer)))
	  (res nil))
      (when (dolist (aname org-agenda-files res)
	      (setq res (or res (string-suffix-p aname bname))))
	(tealeg--org-commit-and-push-todos))))

  (add-hook 'after-save-hook #'tealeg--todo-save-helper-f)
  )





(when (featurep #'completion-preview)
  ;; Enable Completion Preview mode in code buffers
  (add-hook 'prog-mode-hook #'completion-preview-mode)
  ;; also in text buffers
  (add-hook 'text-mode-hook #'completion-preview-mode)
  ;; and in \\[shell] and friends
  (with-eval-after-load 'comint
    (add-hook 'comint-mode-hook #'completion-preview-mode))

  (with-eval-after-load 'completion-preview
    ;; Show the preview already after two symbol characters
    (setq completion-preview-minimum-symbol-length 2)

  ;; Non-standard commands to that should show the preview:

    ;; Org mode has a custom `self-insert-command'
    (push 'org-self-insert-command completion-preview-commands)
    ;; Paredit has a custom `delete-backward-char' command
    (push 'paredit-backward-delete completion-preview-commands)

    ;; Bindings that take effect when the preview is shown:

    ;; Cycle the completion candidate that the preview shows
    (keymap-set completion-preview-active-mode-map "M-n" #'completion-preview-next-candidate)
    (keymap-set completion-preview-active-mode-map "M-p" #'completion-preview-prev-candidate)
    ;; Convenient alternative to C-i after typing one of the above
    (keymap-set completion-preview-active-mode-map "M-i" #'completion-preview-insert)))


;;;;

(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (setq treesit-auto-langs '(awk bash bibtex c cmake commonlisp cpp css dockerfile go gomod html javascript json lua make nix org perl proto python sql toml typescript yaml))

  (treesit-auto-install-all))

(use-package treesit-fold
  :ensure t)


;; (use-package copilot
;;   :vc (:url "https://github.com/copilot-emacs/copilot.el"
;; 	    :rev :newest
;; 	    :branch "main")
;;   :hook ((prog-mode-hook . copilot-mode))
;;   :bind (
;; 	 ("C-<tab>" . copilot-accept-completion-by-word)
;; 	 ("C-<return>" . copilot-accept-completion-by-word)
;; 	 ("C-<backtab>" . copilot-next-completion)
;; 	 ("C-<left>" . copilot-previous-completion)
;; 	 ("C-<right>" . copilot-next-completion)
;; 	 ("C-<up>" . copilot-next-completion)
;; 	 ("C-<down>" . copilot-previous-completion))
;;   )



;;;; eglot

;; (require 'go-ts-mode)

;; (use-package eglot
;;   :ensure t
;;   ;; :defer t
;;   :bind (:map eglot-mode-map
;; 	      ("C-c e f n" . flymake-goto-next-error)
;; 	      ("C-c e f p" . flymake-goto-previous-error)
;; 	      ("C-c e r" . eglot-rename)
;; 	      ("C-c e b" . eglot-format-buffer))
;;   :hook (go-ts-mode . eglot-ensure))


(use-package eldoc-box
  :ensure t
  :config
  (eldoc-box-hover-mode 1))


(use-package sly
  :ensure t
  :config 
  (cond ((eq system-type 'darwin) (setq inferior-lisp-program "/opt/homebrew/bin/sbcl"))
	((eq system-type 'berkeley-unix) (setq inferior-lisp-program "/usr/local/bin/sbcl"))
  ))


(use-package epresent
  :ensure t)

(require 'org-faces)

(defgroup tealeg--org-faces nil
  "Faces defined by tealeg."
  :tag "Tealeg Faces"
  :group 'org-appearance)

(defface tealeg--org-heading '((t :inherit variable-pitch))
  "Face used by tealeg to override org-headings via Modus themes."
  :group 'tealeg--org-faces)

(defun tealeg--set-faces (mono-face variable-face heading-face size spacing)
  (set-face-font 'default (concat mono-face "-" size))
  ;; (set-face-font 'italic nil (concat mono-face "-" size))
  (set-face-font 'variable-pitch (concat variable-face "-" size))
  (set-face-font 'fixed-pitch (concat mono-face "-" size))
  (set-face-font 'tealeg--org-heading (concat heading-face "-" size))
  (setf line-spacing spacing))

;; Go
(use-package gotest
  :ensure t
  :config
  (defun tealeg--go-ts-mode-helper-f ()
    (eglot-ensure))
  
  (add-hook 'go-ts-mode-hook #'tealeg--go-ts-mode-helper-f)
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package dape
  :ensure t
  :after gotest)

;; Magit

(use-package magit 
  ;; :after transient
  :ensure t
  :bind ("C-x g" . magit-status)
  )


;; Enable Vertico.
(use-package vertico
  :ensure t
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 20) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))


(use-package racket-mode
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package idris-mode
  :ensure t
  :config (setq idris-interpreter-path (shell-command-to-string "which idris2"))
  )

;; Support opening new minibuffers from inside existing minibuffers.
(setq enable-recursive-minibuffers t
      ;; Hide commands in M-x which do not work in the current mode.  Vertico
      ;; commands are hidden in normal buffers. This setting is useful beyond
      ;; Vertico.
      read-extended-command-predicate #'command-completion-default-include-p
      ;; Do not allow the cursor in the minibuffer prompt
      minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt)

      ;; Enable indentation+completion using the TAB key.
      ;; `completion-at-point' is often bound to M-TAB.
      tab-always-indent 'complete

      ;; Emacs 30 and newer: Disable Ispell completion function.
      ;; Try `cape-dict' as an alternative.
      text-mode-ispell-word-completion nil

      ;; Hide commands in M-x which do not apply to the current mode.  Corfu
      ;; commands are hidden, since they are not used via M-x. This setting is
      ;; useful beyond Corfu.
      read-extended-command-predicate #'command-completion-default-include-p)

;; Save history between sessions
(savehist-mode)

;; don't auto-save and back up files
(setq auto-save-default nil
      make-backup-files nil)

(setq visible-bell t)
(if (eq system-type 'haiku)
    (progn
      ;; for some reason I like this on haiku
      (setq indicate-buffer-boundaries 'right
	    indicate-empty-lines t)
      (tool-bar-mode 1)
      (menu-bar-mode 1)
      (scroll-bar-mode 1))
  (progn
    (tool-bar-mode -1)
    (menu-bar-mode -1)
    (scroll-bar-mode -1)))

;; Final setup
(if (file-exists-p custom-file)
    (load custom-file))

;;; look and feel

(use-package modus-themes
  :ensure t
  :config

  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui nil
        modus-themes-custom-auto-reload t
        modus-themes-disable-other-themes t

        ;; Options for `modus-themes-prompts' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `italic', `WEIGHT'
        modus-themes-prompts '(italic bold)

        ;; The `modus-themes-completions' is an alist that reads two
        ;; keys: `matches', `selection'.  Each accepts a nil value (or
        ;; empty list) or a list of properties that can include any of
        ;; the following (for WEIGHT read further below):
        ;;
        ;; `matches'   :: `underline', `italic', `WEIGHT'
        ;; `selection' :: `underline', `italic', `WEIGHT'
        modus-themes-completions
        '((matches . (extrabold))
          (selection . (semibold italic text-also)))

        modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

        ;; The `modus-themes-headings' is an alist: read the manual's
        ;; node about it or its doc string.  Basically, it supports
        ;; per-level configurations for the optional use of
        ;; `variable-pitch' typography, a height value as a multiple of
        ;; the base font size (e.g. 1.5), and a `WEIGHT'.
        modus-themes-headings
        '((1 . (variable-pitch 1.5))
          (2 . (variable-pitch 1.3))
          (agenda-date . (1.3))
          (agenda-structure . (variable-pitch light 1.8))
          (t . (1.1))))

  
  (defun tealeg--on-theme-change-f ()

    ;; Add frame borders and window dividers
    (modify-all-frames-parameters
     '((right-divider-width . 40)
       (internal-border-width . 40)))
    (cond ((eq system-type 'darwin)
	   (tealeg--set-faces "Menlo" "American Typewriter" "Gill Sans" "22" 0.5))
	  ((eq system-type 'linux)
	   (tealeg--set-faces "IBM Plex Mono" "IBM Plex Serif" "IBM Plex Sans" "12" 0.3))
	  ((eq system-type 'berkeley-unix)
	   (tealeg--set-faces "Latin Modern Mono Light" "Latin Modern Roman Dunhill" "Latin Modern Roman Dunhill" "12" 0.1))
	  )
    (dolist (face '(window-divider
                    window-divider-first-pixel
                    window-divider-last-pixel))
      (face-spec-reset-face face)
      (set-face-foreground face (face-attribute 'default :background)))
    (set-face-background 'fringe (face-attribute 'default :background)))

  (add-hook 'modus-themes-post-load-hook #'tealeg--on-theme-change-f)
  (modus-themes-load-theme 'modus-vivendi-tritanopia)

  
  )

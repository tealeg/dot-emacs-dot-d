;;;; basics

(setq inhibit-startup-screen t)
(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


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


(use-package nlinum
  :ensure t
  :config
  (defun linum-mode (arg)
    (interactive "P")
    (nlinum-mode arg))
  )
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
	org-agenda-files '("todo.org" "habits.org" "completed.org"))
  (defun tealeg--org-mode-helper-f ()
      (org-modern-mode 1)
    (flyspell-mode 1)
    )
  
  (add-hook 'org-mode-hook #'tealeg--org-mode-helper-f)

  (defun tealeg--org-commit-and-push-todos ()
    (interactive)
    (require 'magit)
    (require 'magit-process)
    (dolist (fname org-agenda-files)
      (magit-run-git "add" fname))
    (magit-run-git "commit" "-m" "'Update TODOs'")
    (magit-run-git "push" "origin" "main"))

  (defun tealeg--todo-save-helper-f ()
    (interactive)
    (let ((bname (buffer-file-name (current-buffer)))
	  (res nil))
      (when (dolist (aname org-agenda-files res)
	      (setq res (or res (string-suffix-p aname bname))))
	(tealeg--org-commit-and-push-todos))))

  (add-hook 'after-save-hook #'tealeg--todo-save-helper-f)
  )


	
  

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
  (keymap-set completion-preview-active-mode-map "M-i" #'completion-preview-insert))


;;;;

(use-package treesit-auto
  :ensure t
  :demand t
  :config
  (setq treesit-auto-langs '(awk bash bibtex c cmake commonlisp cpp css dockerfile go gomod html javascript json lua make nix org perl proto python rust sql toml typescript yaml))

  (treesit-auto-install-all))

(use-package treesit-fold
  :ensure t)


;;;; eglot

(require 'go-ts-mode)

(use-package eglot
  :ensure t
  ;; :defer t
  :bind (:map eglot-mode-map
	      ("C-c e f n" . flymake-goto-next-error)
	      ("C-c e f p" . flymake-goto-previous-error)
	      ("C-c e r" . eglot-rename)
	      ("C-c e b" . eglot-format-buffer))
  :hook (go-ts-mode . eglot-ensure))


(use-package eldoc-box
  :ensure t
  :config
  (eldoc-box-hover-mode 1))

;; (use-package company
;;   :config
;;   (global-company-mode))


(use-package org-modern
  :ensure t
  :config
  (require 'org-tempo)
  (org-tempo-setup)
  )

(use-package epresent
  :ensure t)

(defconst mm-per-point 0.3527777778)

(defun point-size-to-mm (point-size)
  (* point-size mm-per-point))

(defun mm-to-point-size (mm)
  (/ mm mm-per-point))

(defun font-size-at-res (point-size)
  (truncate (let* ((font-mm (point-size-to-mm point-size))
		   (screen (frame-monitor-attributes))
		   (screen-mm (alist-get 'mm-size screen))
		   (screen-pixels (alist-get 'geometry screen))
		   (screen-pixel-height (nth 3 screen-pixels))
		   (screen-mm-height (cadr screen-mm))
		   (pixels-per-mm (/  screen-pixel-height (* screen-mm-height 1.0))))
	      (mm-to-point-size (* font-mm pixels-per-mm)))))


(require 'org-faces)
(defun tealeg--on-monitor-change (terminal) 
  (progn
    (let* ((size-mm (font-size-at-res 3))
	   (size (int-to-string size-mm)))
      (set-face-font 'default
		     (concat "IBM Plex Mono-" size ":weight=regular"))
      (set-face-font 'variable-pitch
		     (concat "IBM Plex Serif-" size ":weight=regular"))
      (set-face-font 'font-lock-comment-face
		     (concat "IBM Plex Serif-" size ":weight=regular:slant=normal"))
      (set-face-font 'font-lock-string-face
		     (concat "IBM Plex Mono-" size ":weight=regular:slant=italic"))
      (setf line-spacing (/ size-mm 100.0))
      )))

(add-hook 'display-monitors-changed-functions #'tealeg--on-monitor-change)
(tealeg--on-monitor-change 1)


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

;; (use-package orangey-bits-theme
;;   :ensure t
;;   :config
;;   (load-theme 'orangey-bits 'no-confirm))
;; (use-package dark-mint-theme
;;   :ensure t
;;   :config
;;   (load-theme 'dark-mint 'no-confirm))
(use-package prassee-theme
  :ensure t
  :config
  (if (eq system-type 'haiku)
    (load-theme 'leuven 'no-confirm)
    (load-theme 'prassee 'no-confirm)))


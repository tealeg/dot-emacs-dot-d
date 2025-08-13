;;; init.el -- emacs config  -*- lexical-binding: t -*-
;;; Commentary:
;;; It all starts here.
;;; Code:

;;;; basics

(require 'time)
(setq auto-save-default nil
      make-backup-files nil
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-buffer-choice t
      initial-major-mode 'fundamental-mode
      ring-bell-function 'ignore
      display-time-default-load-average nil
      scroll-margin 0
      use-dialog-box nil
      visible-bell t)
(set-fringe-mode 10)
(show-paren-mode t)
(setq-default fringes-outside-margins nil)
(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines nil)
(setq-default cursor-type 'bar)
(set-face-attribute 'header-line t :inherit 'default)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'ansi-color)
(require 'compile)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(setq package-enable-at-startup nil)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


(use-package gcmh
  :ensure t
  :init
  (gcmh-mode 1))

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

(when (eq system-type 'darwin)
  (require 'info)
  (setopt Info-additional-directory-list (list "/opt/homebrew/share/info")))


;; Delimeters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode-hook . rainbow-delimiters-mode))

;; Spelling

(use-package flyspell
  :ensure t
  :config
  (require 'ispell)
  (unless (eq system-type 'berkeley-unix)
    (setq ispell-dictionary "en_GB")))

;; Tabs or spaces

(defun infer-indentation-style ()
  "Default to no tabs, but use tabs if already in project."
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count   (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq-default indent-tabs-mode nil))
    (if (> tab-count space-count) (setq-default indent-tabs-mode t))))

(setq-default indent-tabs-mode nil)
(infer-indentation-style)
(setq backward-delete-char-untabify-method 'hungry)


(use-package mixed-pitch
  :defer t
  :ensure
  :hook ((org-mode   . mixed-pitch-mode)
         (LaTeX-mode . mixed-pitch-mode)))


;; Org-mode
(use-package org
  :ensure t
  :init
  (require 'org-agenda)
  (require 'org-habit)
  (require 'ox-md)
  (require 'org-indent)
  :config

  (setq
   org-adapt-indentation t
   org-agenda-files '("todo.org" "habits.org" "archive.org")
   org-agenda-tags-column 0
   org-auto-align-tags t
   org-catch-invisible-edits 'show-and-error
   org-edit-src-content-indentation 0
   org-ellipsis "…"
   org-fold-catch-invisible-edits 'show-and-error
   org-hide-emphasis-markers nil
   org-hide-leading-stars nil
   org-insert-heading-respect-content t
   org-log-done 'time
   org-log-into-drawer t
   org-pretty-entities t
   org-special-ctrl-a/e t
   org-src-fontify-natively t
   org-src-tab-acts-natively t
   org-tags-column -80
   org-todo-keywords (list "BLOCKED" "TODO" "IN-PROGRESS" "|" "DONE" "CANCELED" "DELEGATED"))
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (defun tealeg--org-mode-helper-f ()
    (flyspell-mode 1)
    (variable-pitch-mode 1)
    (electric-indent-local-mode -1)
    (org-indent-mode 1)
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
	(magit-run-git "add" fname)
      ;; 	(when (tealeg--is-file-modified fname)
	(setq modified t)))
      ;; (when modified
    (magit-run-git "commit" "-m" (concat "'Update TODOs " (current-time-string) "'"))
    (magit-run-git-with-editor "pull" "-r" "origin" "main")
    (magit-run-git "push" "origin" "main")) ;; ))
  
  (defun tealeg--todo-save-helper-f ()
    (interactive)
    (let ((bname (buffer-file-name (current-buffer)))
	  (res nil))
      (when (dolist (aname org-agenda-files res)
	      (setq res (or res (string-suffix-p aname bname))))
	(tealeg--org-commit-and-push-todos))))

  (add-hook 'after-save-hook #'tealeg--todo-save-helper-f)
  )

(use-package ob-mermaid
  :ensure t)


(defvar ligature-def '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                       "\\\\" "://"))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 'prog-mode ligature-def)
  (global-ligature-mode t))



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
  (setq treesit-auto-langs '(awk bash c cmake commonlisp cpp css dockerfile go gomod html javascript json lua make nix org perl proto python sql toml typescript yaml))

  (unless (eq system-type 'berkeley-unix)
    (treesit-auto-install-all))
  (add-to-list 'auto-mode-alist  '("\\.go\\'" . go-ts-mode)))

(use-package treesit-fold
  :ensure t)


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


(when (display-graphic-p)
  (use-package all-the-icons
    :ensure t))

(use-package epresent
  :ensure t)

;; (require 'org-faces)

;; (defgroup tealeg--org-faces nil
;;   "Faces defined by tealeg."
;;   :tag "Tealeg Faces"
;;   :group 'org-appearance)

;; (defface tealeg--org-heading '((t :inherit variable-pitch))
;;   "Face used by tealeg to override org-headings via Modus themes."
;;   :group 'tealeg--org-faces)

(defun tealeg--set-faces (mono-face variable-face heading-face size spacing)

  (set-fontset-font t nil (font-spec :size (string-to-number size) :name "Symbol"))

  (set-face-font 'default (concat mono-face "-" size))
  ;; (set-face-font 'italic nil (concat mono-face "-" size))
  (set-face-font 'variable-pitch (concat variable-face "-" size))
  (set-face-font 'fixed-pitch (concat mono-face "-" size))
  ;; (set-face-font 'tealeg--org-heading (concat heading-face "-" size))
  (custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-title ((t (:height 3 :box (:line-width 4)))))
   '(outline-1          ((t (:height 2.5 :box (:line-width 4)))))
   '(outline-2          ((t (:height 2.2 :box (:line-width 4)))))
   '(outline-3          ((t (:height 2.0 :box (:line-width 4)))))
   '(outline-4          ((t (:height 1.8 :box (:line-width 4)))))
   '(outline-5          ((t (:height 1.6))))
   '(outline-6          ((t (:height 1.5))))
   '(outline-7          ((t (:height 1.4))))
   '(outline-8          ((t (:height 1.3))))
   '(outline-9          ((t (:height 1.2))))
   )  
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
  :custom
  (magit-git-executable (executable-find "git"))
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
    (scroll-bar-mode -1)
    (blink-cursor-mode -1)
    ))

;; Final setup
(if (file-exists-p custom-file)
    (load custom-file))

;;; look and feel

(use-package focus
  :defer t
  :ensure t)

(use-package beacon
  :defer t
  :ensure t
  :init  (beacon-mode 1)
  :config
  (setq beacon-blink-when-window-scrolls nil))

(use-package nerd-icons
  :ensure t)

(use-package mermaid-ts-mode
  :ensure t)

(use-package emojify
  :ensure t
  :config
  (when (member "Apple Color Emoji" (font-family-list))
    (set-fontset-font
      t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)))

;; (use-package modus-themes
;;   :ensure t
;;   :config

;;   (setq modus-themes-italic-constructs t
;;         modus-themes-bold-constructs nil
;;         modus-themes-mixed-fonts t
;;         modus-themes-variable-pitch-ui nil
;;         modus-themes-custom-auto-reload t
;;         modus-themes-disable-other-themes t

;;         ;; Options for `modus-themes-prompts' are either nil (the
;;         ;; default), or a list of properties that may include any of those
;;         ;; symbols: `italic', `WEIGHT'
;;         modus-themes-prompts '(italic bold)

;;         ;; The `modus-themes-completions' is an alist that reads two
;;         ;; keys: `matches', `selection'.  Each accepts a nil value (or
;;         ;; empty list) or a list of properties that can include any of
;;         ;; the following (for WEIGHT read further below):
;;         ;;
;;         ;; `matches'   :: `underline', `italic', `WEIGHT'
;;         ;; `selection' :: `underline', `italic', `WEIGHT'
;;         modus-themes-completions
;;         '((matches . (extrabold))
;;           (selection . (semibold italic text-also)))

;;         modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

;;         ;; The `modus-themes-headings' is an alist: read the manual's
;;         ;; node about it or its doc string.  Basically, it supports
;;         ;; per-level configurations for the optional use of
;;         ;; `variable-pitch' typography, a height value as a multiple of
;;         ;; the base font size (e.g. 1.5), and a `WEIGHT'.
;;         modus-themes-headings
;;         '((1 . (variable-pitch 1.5))
;;           (2 . (variable-pitch 1.3))
;;           (agenda-date . (1.3))
;;           (agenda-structure . (variable-pitch light 1.8))
;;           (t . (1.1))))

(use-package acme-theme
  :ensure t
  :init
  (defun tealeg--on-theme-change-f ()

    ;; Add frame borders and window dividers
    (modify-all-frames-parameters
     '((right-divider-width . 8)
       (internal-border-width . 8)))
    (cond ((eq system-type 'darwin)
	   (tealeg--set-faces "IBM Plex Mono" "IBM Plex Serif" "IBM Plex Sans" "16" 0.3))
	  ((eq system-type 'linux)
	   (tealeg--set-faces "IBM Plex Mono" "IBM Plex Serif" "IBM Plex Sans" "12" 0.3))
	  ((eq system-type 'berkeley-unix)
           (tealeg--set-faces "IBM Plex Mono" "IBM Plex Serif" "IBM Plex Sans" "12" 0.3))
	  )
    (dolist (face '(window-divider
                    window-divider-first-pixel
                    window-divider-last-pixel))
      (face-spec-reset-face face)
      (set-face-foreground face (face-attribute 'default :background)))
    (set-face-background 'fringe (face-attribute 'default :background)))

  ;; (add-hook 'modus-themes-post-load-hook #'tealeg--on-theme-change-f)
  ;; (modus-themes-load-theme 'modus-vivendi-tritanopia)

  (load-theme 'acme t nil)
  (tealeg--on-theme-change-f)
  )

(defvar lsp-modeline--code-actions-string nil)

;; (setq-default mode-line-format
;;   '("%e"
;; 	(:propertize " " display (raise +0.4)) ;; Top padding
;; 	(:propertize " " display (raise -0.4)) ;; Bottom padding

;; 	(:propertize "λ " face font-lock-comment-face)
;; 	mode-line-frame-identification
;; 	mode-line-buffer-identification

;; 	;; Version control info
;; 	(:eval (when-let (vc vc-mode)
;; 			 ;; Use a pretty branch symbol in front of the branch name
;; 			 (list (propertize "   " 'face 'font-lock-comment-face)
;;                    ;; Truncate branch name to 50 characters
;; 				   (propertize (truncate-string-to-width
;;                                 (substring vc 5) 50)
;; 							   'face 'font-lock-comment-face))))

;; 	;; Add space to align to the right
;; 	(:eval (propertize
;; 			 " " 'display
;; 			 `((space :align-to
;; 					  (-  (+ right right-fringe right-margin)
;; 						 ,(+ 3
;;                              (string-width (or lsp-modeline--code-actions-string ""))
;;                              (string-width "%4l:3%c")))))))

;;     ;; LSP code actions
;;     (:eval (or lsp-modeline--code-actions-string ""))
	
;; 	;; Line and column numbers
;; 	(:propertize "%4l:%c" face mode-line-buffer-id)))

(add-to-list 'font-lock-extra-managed-props 'display)
(font-lock-add-keywords 'org-mode
                        `(("^.*?\\( \\)\\(:[[:alnum:]_@#%:]+:\\)$"
                           (1 `(face nil
                                     display (space :align-to (- right ,(org-string-width (match-string 2)) 3)))
                              prepend))) t)


;; (use-package typescript-ts-mode
;;   :ensure t)

;; (use-package jtsx
;;   :ensure t)

(use-package treemacs
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package geiser-guile
  :ensure t
  )

(use-package macrostep-geiser
  :ensure t)

(use-package quack
  :ensure t)

(use-package paredit
  :ensure t
  :init
  
  (require 'eldoc) ; if not already loaded
    (eldoc-add-command
     'paredit-backward-delete
     'paredit-close-round)

    :hook scheme-mode)

(provide 'init)
;;; init.el ends here

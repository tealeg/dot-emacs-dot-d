;; (add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window after starting Emacs
(setq inhibit-startup-message t) ;; Close Emacs launch screen
(setq inhibit-splash-screen t)   ;; Close Emacs startup help screen
(setq initial-scratch-message (concat ";; Happy hacking, " user-login-name " - Emacs \u2665 you!\n\n"))
;; Show your last execute command
(setq frame-title-format
      '(:eval (format "Emacs - %s  [ %s ]"
                      (buffer-name)
                      last-command))
      icon-title-format t)

(unless (eq system-type 'darwin)
  (menu-bar-mode 0) ;; Emacs Text Toolbar above
  )
(tool-bar-mode 0) ;; Close Emacs icon toolbar above
(scroll-bar-mode 0) ;; Close scrollbar
(set-fringe-mode 12) ;; increase fringe width
(show-paren-mode t)

(setq-default fringes-outside-margins nil)
(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines nil)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(setq ring-bell-function 'ignore) ;; Close Emacs warning sound

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'ansi-color)
(require 'compile)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)


;; File related: Backup, Delete Recycle Bin
(setq make-backup-files nil        ;; Close the backup file
      create-lockfiles nil         ;; Close Create a backup file
      delete-by-moving-to-trash t) ;; Emacs moves to the recycling bin when deleting files

(defun my-modus-themes-invisible-dividers (&rest _)
  "Make window dividers for THEME invisible."
  (let ((bg (face-background 'default)))
    (custom-set-faces
     `(fringe ((t :background ,bg :foreground ,bg)))
     `(window-divider ((t :background ,bg :foreground ,bg)))
     `(window-divider-first-pixel ((t :background ,bg :foreground ,bg)))
     `(window-divider-last-pixel ((t :background ,bg :foreground ,bg))))))

(add-hook 'enable-theme-functions #'my-modus-themes-invisible-dividers)

(load-theme 'modus-vivendi-deuteranopia t nil)

(use-package unicode-fonts
  :ensure t
  :config
  (unicode-fonts-setup))

(if (eq system-type 'berkeley-unix)
    (progn
      (set-frame-font "Hack-15:weight=Regular")
      (set-face-font 'default "Hack-15:weight=Regular")
      (set-face-font 'fixed-pitch "Hack-15:weight=Regular")
      (set-face-font 'fixed-pitch-serif "Hack-15:weight=Regular")
      (set-face-font 'variable-pitch "Noto Sans-15:weight=Regular")
      (set-face-font 'variable-pitch-text "Noto Serif-15:weight=Regular")
      (set-face-font 'font-lock-comment-face "Noto Serif-15:weight=Regular:slant=italic"))
  (progn
    (set-frame-font "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'default "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'fixed-pitch "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'fixed-pitch-serif "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'variable-pitch "IBM Plex Sans-17:weight=Regular")
    (set-face-font 'variable-pitch-text "IBM Plex Serif-17:weight=Regular")
    (set-face-font 'font-lock-comment-face "IBM Plex Serif-17:weight=Regular:slant=italic")))


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


(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Sometimes you want to keep the package available, so that it can be fixed in a certain version forever.
;; (setq  package-archives '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/melpa/");; 2025-02-25 8:00
;;                           ("gnu" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/gnu/");; 2025-07-25 8:00
;;                           ("org" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/org/");; 2025-07-25 8:00
;;                           ("nongnu" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/nongnu/");; 2025-07-25 8:00
;;                           ))

(use-package spacious-padding
  :ensure t
  :config
  (spacious-padding-mode t))

;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(when (eq system-type 'darwin)
  (require 'info)
  (setopt Info-additional-directory-list (list "/opt/homebrew/share/info")))


(use-package magit
  :ensure t)

(use-package gcmh
  :ensure t
  :init
  (gcmh-mode 1))

(use-package flyspell
  :ensure t
  :config
  (require 'ispell)
  (unless (eq system-type 'berkeley-unix)
    (setq ispell-dictionary "en_GB")))


;; modelline display time
(use-package time
  :ensure nil
  :hook (after-init . display-time-mode)
  :custom
  (display-time-24hr-format t);; 24-hour system
  (display-time-format "%m-%d %a %H:%M")
  (display-time-day-and-date t) ;; Show time, day, date
  )

;; Automatically update files after external changes
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))


;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(when (eq system-type 'darwin)
  (require 'info)
  (setopt Info-additional-directory-list (list "/opt/homebrew/share/info")))


(use-package eglot
  :ensure nil
  :if (>= emacs-major-version 29)
  :hook
  (eglot-managed-mode . (lambda () (eglot-inlay-hints-mode -1)));; No prompt is displayed
  :hook
  ;; NOTE: Please add your programming language here
  ((c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode) . eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c la" . eglot-code-actions) ;; Automatically write/repair code.
              ("C-c lr" . eglot-rename)
              ("C-c lf" . eglot-format) ;; Format current buffer
              ("C-c lc" . eglot-reconnect)
              ("C-c ld" . eldoc)) ;; view document
  :custom
  (eglot-autoshutdown t) ;; Automatically stop after closing all projects buffer
  (eglot-report-progress nil);; Hide all eglot event buffers
  :config
  (setq eglot-stay-out-of '(company));; No other complementary backend options are changed
  )

(use-package org
  :ensure nil
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
  (add-to-list 'org-agenda-custom-commands '("c" . "Closed"))
  (add-to-list 'org-agenda-custom-commands '("c1" tags "TODO=\"DONE\"&CLOSED>=\"<-1d>\""))
  (add-to-list 'org-agenda-custom-commands '("c2" tags "TODO=\"DONE\"&CLOSED>=\"<-2d>\""))
  (add-to-list 'org-agenda-custom-commands '("cw" tags "TODO=\"DONE\"&CLOSED>=\"<-1w>\""))
  (add-to-list 'org-agenda-custom-commands '("cm" tags "TODO=\"DONE\"&CLOSED>=\"<-1m>\""))
  (add-to-list 'org-agenda-custom-commands '("cy" tags "TODO=\"DONE\"&CLOSED>=\"<-1y>\""))

  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (defun tealeg--org-mode-helper-f ()
    (flyspell-mode 1)
    (variable-pitch-mode 1)
    (electric-indent-local-mode -1)
    (org-indent-mode 1)
    (set-face-font 'org-table "IBM Plex Mono" nil)
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
	(setq modified t)))
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

(use-package ox-typst
  :after org
  :ensure t
  :init
  (require 'ox-typst))


(bind-key "M-+" 'text-scale-increase)
(bind-key "M--" 'text-scale-decrease)


;; (use-package aidermacs
;;   :ensure t
;;   :bind (("C-c a" . aidermacs-transient-menu))
;;   ;; :config
;;   :custom
;;   (aidermacs-default-chat-mode 'architect)
;;   (aidermacs-default-model "github_copilot/gpt-4.1"))

(use-package indent-bars
  :ensure t
  :hook ((yaml-ts-mode) . indent-bars-mode))

(use-package typst-ts-mode
  :ensure t)

(use-package emojify
  :ensure t)

(use-package discover
  :ensure t)

;; (use-package mastodon
;;   :ensure t
;;   :after emojify
;;   :config
;;   (mastodon-discover)
;;   (setq mastodon-instance-url "https://mastodon.online"
;; 	mastodon-active-user "geoffrey@teale.de")

;;   )
  

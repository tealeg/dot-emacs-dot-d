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
(display-battery-mode 1)

(setq-default fringes-outside-margins nil)
(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines nil)
(setq-default cursor-type 'bar)
(setq scroll-conservatively 1000)
(setq scroll-margin 3)
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



(use-package doom-themes
  :ensure t
  :config
  ;; (load-theme 'doom-outrun-electric t nil)
  ;; (load-theme 'doom-flatwhite t nil)
  ;; (load-theme 'doom-feather-dark t nil)
  (load-theme 'doom-challenger-deep t nil)

  )

(use-package doom-modeline
  :ensure t
  :after doom-themes
  :config
  (setq doom-modeline-hud t)
  :init
  (doom-modeline-mode 1))

(use-package use-package-ensure-system-package)

;; (use-package unicode-fonts
;;   :ensure t
;;   :config
;;   (unicode-fonts-setup))


(if (eq system-type 'berkeley-unix)
    (progn
      (set-frame-font "IBM Plex Mono-9:weight=Regular")
      (set-face-font 'default "IBM Plex Mono-9:weight=Regular")
      (set-face-font 'fixed-pitch "IBM Plex Mono-9:weight=Regular")
      (set-face-font 'fixed-pitch-serif "IBM Plex Mono-9:weight=Regular")
      (set-face-font 'variable-pitch "IBM Plex Sans-9:weight=Regular")
      (set-face-font 'variable-pitch-text "IBM Plex Serif-9:weight=Regular")
      (set-face-font 'font-lock-comment-face "IBM Plex Serif-9:bweight=Regular:slant=italic")
      (set-face-font 'doom-modeline "IBM Plex Sans-10:weight=Regular")

      )
  
  (progn
    (set-frame-font "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'default "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'fixed-pitch "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'fixed-pitch-serif "IBM Plex Mono-17:weight=Regular")
    (set-face-font 'variable-pitch "IBM Plex Sans-17:weight=Regular")
    (set-face-font 'variable-pitch-text "IBM Plex Serif-17:weight=Regular")
    (set-face-font 'font-lock-comment-face "IBM Plex Serif-17:weight=Regular:slant=italic")))

(setq line-spacing 0.1)



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


(when (eq system-type 'darwin)
  (require 'info)
  (setopt Info-additional-directory-list (list "/opt/homebrew/share/info")))


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
   org-log-done nil
   org-log-repeat nil
   org-log-into-drawer nil
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


(use-package eglot
  :ensure nil
  :if (>= emacs-major-version 29)
  :hook
  (eglot-managed-mode . (lambda () (eglot-inlay-hints-mode -1)));; No prompt is displayed
  :hook
  ;; NOTE: Please add your programming language here
  ((c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode go-ts-mode) . eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c la" . eglot-code-actions) ;; Automatically write/repair code.
              ("C-c lr" . eglot-rename)
              ("C-c lf" . eglot-format) ;; Format current buffer
              ("C-c lc" . eglot-reconnect)
              ("C-c ld" . eldoc)) ;; view document
  :custom
  (eglot-autoshutdown t) ;; Automatically stop after closing all projects buffer
  (eglot-report-progress nil);; Hide all eglot event buffers
)
;; -  :config
;; -  (setq eglot-stay-out-of '(company)));; No other complementary backend options are changed

;; (use-package eglot-booster
;;   :ensure t
;;   :after eglot
;;   :config	(eglot-booster-mode))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode t))

  
(use-package pel-ert
  :vc (:url "https://github.com/pierre-rouleau/pel" :main-file "pel-ert.el" :rev :newest)
  :ensure t)

(use-package seed7-mode
  :after pel-ert
  :vc (:url "https://github.com/pierre-rouleau/seed7-mode" :rev :newest)
  :ensure t
  :config 
  (autoload 'seed7-mode "seed7-mode" nil :interactive)
  (add-to-list 'auto-mode-alist '("\\.s\\(d7\\|7i\\)\\'" . seed7-mode))
  )


(use-package mu4e-alert
  :ensure t
  :init
  (setq mu4e-alert-interesting-mail-query
    (concat
     "flag:unread maildir:/Mailbox/[Mailbox].INBOX "
     ;; "OR "
     ;; "flag:unread maildir:/Gmail/INBOX"
     ))
  (mu4e-alert-enable-mode-line-display)
  (defun tealeg-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e-alert-enable-mode-line-display)
    )
  (run-with-timer 0 60 'tealeg-refresh-mu4e-alert-mode-line)
  )

(use-package racket-mode
  :ensure t)

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq corfu-auto-prefix 1)

  (when (eq system-type 'berkeley-unix)
      (progn
	(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")
	(require 'mu4e)
	(require 'smtpmail)
	(require 'mu4e-contrib)

	(add-to-list 'display-buffer-alist
               `(,(regexp-quote mu4e-main-buffer-name)
                 display-buffer-same-window))

	(setq mu4e-maildir "~/Maildir"
	      mu4e-get-mail-command "/usr/local/bin/offlineimap -o"
	      mu4e-update-interval 300
	      mu4e-index-cleanup t
	      mu4e-attachment-dir "~/Downloads"
	      mu4e-org-support t
	      mu4e-use-fancy-chars t
	      mu4e-confirm-quit t
	      mu4e-change-filenames-when-moving t
	      mu4e-compose-format-flowed t
	      mail-user-agent 'mu4e-user-agent
	      sendmail-program (executable-find "msmtp")
	      message-send-mail-real-function 'message-send-mail-with-sendmail
	      message-kill-buffer-on-exit t
	      message-sendmail-f-is-evil t
	      message-sendmail-extra-arguments '("--read-envelope-from")
	      message-sendmail-envelope-from 'header
	
	      mu4e-sent-folder "/Mailbox/Sent"
	      mu4e-drafts-folder "/Mailbox/Drafts"
	      ;; smtpmail-default-smtp-server "smtp.mailbox.org"
	      ;; smtpmail-smtp-server "smtp.mailbox.org"
	      ;; smtpmail-smtp-service 587
	      ;; smtpmail-smtp-user "tealeg@mailbox.org"
	      
	      )
	(setq mu4e-contexts
	      `( ,(make-mu4e-context
		   :name "Mailbox"
		   :match-func (lambda (msg) (when msg
					       (string-prefix-p "/Mailbox" (mu4e-message-field msg :maildir))))
		   :vars '(
			   (mu4e-trash-folder . "/Mailbox/[Mailbox].Trash")
			   (mu4e-refile-folder . "/Mailbox/[Mailbox].Archive")
			   ))))))
    
  )



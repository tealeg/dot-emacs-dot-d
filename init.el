;;;; basics
;; don't auto-save and back up files
(setq auto-save-default nil
      make-backup-files nil)


(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier nil))


(add-to-list 'load-path "~/.config/emacs/lisp")

(require 'tealeg--elpaca)
(elpaca-wait)

;;; look and feel
(use-package orangey-bits-theme
  :config
  (load-theme 'orangey-bits 'no-confirm))

;;;; eglot
;; it needs to install `jsonrpc' from elpa
(use-package jsonrpc)

(use-package eglot
  :after jsonrpc
  :config
  (define-key eglot-mode-map (kbd "C-c <tab>") #'company-complete) ; initiate the completion manually
  (define-key eglot-mode-map (kbd "C-c e f n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e f p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  )

(use-package company
  :config
  (global-company-mode))


(use-package org-modern)
(use-package epresent)

(setq eldoc-echo-area-use-multiline-p nil)

(require 'org-faces)
(if (eq system-type 'darwin)
    (progn
      (set-face-font 'default "IBM Plex Mono-23:weight=regular:slant=italic")
      (set-face-font 'fixed-pitch "IBM Plex Mono-23:weight=regular")
      (set-face-font 'variable-pitch "IBM Plex Serif-23:weight=regular")
      (set-face-font 'font-lock-comment-face "IBM Plex Serif-23:weight=regular:slant=normal")
      (set-face-font 'font-lock-string-face "IBM Plex Serif-23:weight=regular:slant=normal")
      (setf line-spacing 0.3)
      )
  (progn
      (set-face-font 'default "IBM Plex Mono-14:weight=regular")
      (set-face-font 'fixed-pitch "IBM Plex Mono-14:weight=regular")
      (set-face-font 'variable-pitch "IBM Plex Serif-14:weight=regular")
      (set-face-font 'font-lock-comment-face "IBM Plex Serif-14:weight=regular:slant=italic")
      (setf line-spacing 0.3)

    ))


;; Go

(defun tealeg--go-ts-mode-helper-f ()
  (eglot-ensure))
  
(add-hook 'go-ts-mode-hook #'tealeg--go-ts-mode-helper-f)
(add-hook 'before-save-hook 'gofmt-before-save)


;; Notmuch
(when (string= system-type "darwin")
    (progn
      (add-to-list 'load-path "/opt/homebrew/share/emacs/site-lisp/notmuch")
      (require 'notmuch)
      (setq notmuch-fcc-dirs "INBOX.Sent")))

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtpauth.mailroute.net"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      user-full-name "gteale"
      smtpmail-local-domain "acm.org"
      user-mail-address "gteale@acm.org"
      )

(add-hook 'notmuch-hello-refresh-hook (lambda () (shell-command "notmuch new")))



;; Magit
(defun +elpaca-unload-seq (e)
  (and (featurep 'seq) (unload-feature 'seq t))
  (elpaca--continue-build e))

(defun +elpaca-seq-build-steps ()
  (append (butlast (if (file-exists-p (expand-file-name "seq" elpaca-builds-directory))
                       elpaca--pre-built-steps elpaca-build-steps))
          (list '+elpaca-unload-seq 'elpaca--activate-package)))

(use-package seq :ensure `(seq :build ,(+elpaca-seq-build-steps)))

(use-package transient
  :after seq
  :ensure)

(use-package magit 
  :after transient
  :ensure t
  :bind ("C-x g" . magit-status)
  )

(use-package greenbar
  :config (add-hook 'comint-mode-hook #'greenbar-mode)
  (add-hook 'compilation-mode-hook #'greenbar-mode)
  )

;; See: https://github.com/blahgeek/emacs-lsp-booster
(use-package eglot-booster
  :ensure (:host "github.com" :repo "jdtsmith/eglot-booster")
  :after eglot
  :config (eglot-booster-mode))

(use-package gotest)

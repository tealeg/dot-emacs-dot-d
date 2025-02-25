;;;; basics
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


(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier nil))

(if (eq system-type 'haiku)
    (add-to-list 'load-path "~/config/settings/emacs/lisp")
  (add-to-list 'load-path "~/.config/emacs/lisp"))

(require 'tealeg--elpaca)
(elpaca-wait)

;;; look and feel
;; (use-package orangey-bits-theme
;;   :config
;;   (load-theme 'orangey-bits 'no-confirm))

;;;; eglot
;; it needs to install `jsonrpc' from elpa
(use-package jsonrpc
  :config
  (require 'eldoc)
  (require 'eglot)
  (setq eldoc-echo-area-use-multiline-p nil)
  (define-key eglot-mode-map (kbd "C-c <tab>") #'company-complete) ; initiate the completion manually
  (define-key eglot-mode-map (kbd "C-c e f n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e f p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  (add-to-list 'auto-mode-alist (cons "\\.go\\'" 'go-ts-mode)) 
  )

(use-package eldoc-box
  :config
  (eldoc-box-hover-mode 1))

(use-package company
  :config
  (global-company-mode))


(use-package org-modern)
(use-package epresent)



(require 'org-faces)
(cond ((eq system-type 'darwin)
       (progn
	 (set-face-font 'default "IBM Plex Mono-23:weight=regular:slant=italic")
	 (set-face-font 'fixed-pitch "IBM Plex Mono-23:weight=regular")
	 (set-face-font 'variable-pitch "IBM Plex Serif-23:weight=regular")
	 (set-face-font 'font-lock-comment-face "IBM Plex Serif-23:weight=regular:slant=normal")
	 (set-face-font 'font-lock-string-face "IBM Plex Serif-23:weight=regular:slant=normal")
	 (setf line-spacing 0.3)
	 'darwin
	 ))
      ((eq system-type 'haiku)
	 'haiku)
      (t 
       (progn
	 (set-face-font 'default "IBM Plex Mono-10:weight=regular")
	 (set-face-font 'fixed-pitch "IBM Plex Mono-10:weight=regular")
	 (set-face-font 'variable-pitch "IBM Plex Serif-10:weight=regular")
	 (set-face-font 'font-lock-comment-face "IBM Plex Serif-10:weight=regular:slant=italic")
	 (setf line-spacing 0.3)
	 t
	 ))
      )


;; Go
(use-package gotest
  :after f
  :config
  (defun tealeg--go-ts-mode-helper-f ()
    (eglot-ensure))
  
  (add-hook 'go-ts-mode-hook #'tealeg--go-ts-mode-helper-f)
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package dape
  :after gotest)


;; Notmuch
(when (string= system-type "darwin")
  (progn
    (add-to-list 'load-path "/opt/homebrew/share/emacs/site-lisp/notmuch")
    (require 'notmuch)
    (setq notmuch-fcc-dirs "INBOX.Sent")

    (setq send-mail-function 'smtpmail-send-it
	  smtpmail-smtp-server "smtpauth.mailroute.net"
	  smtpmail-stream-type 'starttls
	  smtpmail-smtp-service 587
	  user-full-name "gteale"
	  smtpmail-local-domain "acm.org"
	  user-mail-address "gteale@acm.org"
	  )

    (add-hook 'notmuch-hello-refresh-hook (lambda () (shell-command "notmuch new")))))



;; Magit

(use-package s)
(use-package f :after s)

(defun +elpaca-unload-seq (e)
  (and (featurep 'seq) (unload-feature 'seq t))
  (elpaca--continue-build e))

(defun +elpaca-seq-build-steps ()
  (append (butlast (if (file-exists-p (expand-file-name "seq" elpaca-builds-directory))
                       elpaca--pre-built-steps elpaca-build-steps))
          (list '+elpaca-unload-seq 'elpaca--activate-package)))


(use-package seq :after f :ensure `(seq :build ,(+elpaca-seq-build-steps)))

;; (use-package seq :after f)

(use-package transient
  :after seq
  :ensure)

(use-package magit 
  :after transient
  :ensure t
  :bind ("C-x g" . magit-status)
  )

(when (file-exists-p (concat (getenv "HOME") "/bin/eglot-booster"))
  ;; See: https://github.com/blahgeek/emacs-lsp-booster
  (use-package eglot-booster
    :ensure (:host "github.com" :repo "jdtsmith/eglot-booster")
    :preface
    (require 'emacs)
    (require 'jsonrpc)
    (require 'eglot)
    (require 'seq)
    (add-to-list 'exec-path (concat (getenv "HOME") "/bin"))
    
    :config
    (eglot-booster-mode)))




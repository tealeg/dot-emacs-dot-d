;;; tealeg--appearance -- frame configuration  -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code:

(setq lexical-binding t)

(straight-use-package 'smex)
(straight-use-package
  '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))


(require 'nano-layout)

;; Theming Command line options (this will cancel warning messages)
(add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-help" . (lambda (args))))
(add-to-list 'command-switch-alist '("-compact" . (lambda (args))))

(require 'nano-theme-dark)
(require 'nano-theme-light)

(defface bookmark-menu-heading nil "defined just to please nano")

(require 'nano-faces)
(set-frame-font "IBM Plex Mono-16")
(custom-set-default 'nano-font-size 16)
(custom-set-default 'nano-font-family-monospaced "Iosevka")
(custom-set-default 'nano-font-family-proportional "Iosevka Aile")

(nano-faces)

(require 'nano-theme)
(nano-theme)

;; Nano header & mode lines (optional)
(require 'nano-modeline)

(nano-theme-set-dark)
(nano-toggle-theme)
(nano-toggle-theme)
(let ((inhibit-message t))
  (message "Welcome to GNU Emacs / N Λ N O edition")
  (message (format "Initialization time: %s" (emacs-init-time))))

(require 'nano-splash)
(require 'nano-help)

(require 'smex)
(require 'nano-counsel)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

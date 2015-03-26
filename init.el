;;; Package --- Summary
;;;
;;; Persontal emacs settings.

;;; Commentary:
;;;
;;; Everything I need to make Emacs feel like home!

;;; Code:
(add-to-list 'load-path "/home/tealeg/.emacs.d/lisp")

(require 'tealeg-customize)
(require 'tealeg-packages)
(require 'tealeg-autocompile)
(require 'tealeg-backups)
(require 'tealeg-crypto)
(require 'tealeg-frame)
(require 'tealeg-font)
(require 'tealeg-theme)
(require 'tealeg-file)
(require 'tealeg-unicode)
(require 'tealeg-spelling)
(require 'tealeg-shell)
(require 'tealeg-check) ;; Needs flycheck
(require 'tealeg-landscape)
(require 'tealeg-vc)
(require 'tealeg-calendar)
(require 'tealeg-elisp)
(require 'tealeg-go) ;; Needs go-mode
(require 'tealeg-xml)
(require 'tealeg-org) ;; Needs org-page
(require 'tealeg-irc)
(require 'tealeg-python)
(require 'tealeg-automode)
(require 'tealeg-keybindings)

(provide 'init)
;;; init.el ends here


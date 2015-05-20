;;; Package --- Summary
;;;
;;; Personal emacs settings.

;;; Commentary:
;;;
;;; Everything I need to make Emacs feel like home!

;;; Code:
(add-to-list 'load-path "/home/tealeg/.emacs.d/lisp")
(load-file "/home/tealeg/.emacs.d/lisp/tealeg-packages.el")

(require 'tealeg-packages)
(require 'tealeg-customize)
(require 'tealeg-autocompile)
(require 'tealeg-backups)
(require 'tealeg-crypto)
(require 'tealeg-frame)
(require 'tealeg-font)
(require 'tealeg-file)
(require 'tealeg-gnus)
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
(require 'tealeg-theme)

(provide 'init)
;;; init.el ends here

;;; Package --- Summary
;;;
;;; Personal emacs settings.

;;; Commentary:
;;;
;;; Everything I need to make Emacs feel like home!

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

;; This let speeds start up by avoiding some regexps against file names whilst
;; loading.
(let ((file-name-handler-alist nil))
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (load-file "~/.emacs.d/lisp/tealeg-packages.el")
  (require 'tealeg-speed-daemon)
  (require 'tealeg-packages)
  (require 'tealeg-customize)
  (require 'tealeg-autocompile)
  (require 'tealeg-backups)
  ;;(require 'tealeg-crypto)
  (require 'tealeg-frame)
  (require 'tealeg-font)
  (require 'tealeg-file)
  (require 'tealeg-unicode)
  (require 'tealeg-spelling)
  (require 'tealeg-shell)
  (require 'tealeg-check) ;; Needs flycheck
  (require 'tealeg-vc)
  (require 'tealeg-calendar)
  (require 'tealeg-elisp)
  (require 'tealeg-go) ;; Needs go-mode
  (require 'tealeg-js)
  (require 'tealeg-xml)
  (require 'tealeg-org)
  (require 'tealeg-python)
  (require 'tealeg-automode)
  (require 'tealeg-keybindings)
  (require 'tealeg-theme-setup)
  (require 'tealeg-mouse)
  (require 'tealeg-project)
  (require 'tealeg-mail)
  )

(server-start)
(provide 'init)
;;; init.el ends here


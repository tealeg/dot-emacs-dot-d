;;; Package --- Summary
;;;
;;; Personal emacs settings.

;;; Commentary:
;;;
;;; Everything I need to make Emacs feel like home!

;;; Code:


;; This has to come first
(package-initialize)

;; This let speeds start up by avoiding some regexps against file names whilst
;; loading.
(let ((file-name-handler-alist nil))
  (add-to-list 'load-path "/home/tealeg/.emacs.d/lisp")

  (setq package-enable-at-startup nil)

  (unless (assoc-default "melpa" package-archives)
    (add-to-list 'package-archives
		 '("melpa" . "http://melpa.org/packages/") t)
    ;; (package-refresh-contents)
    )

  ;; Put emacs generated customisations somewhere other than this file.
  (setq custom-file "~/.emacs.d/emacs-custom.el")
  (load custom-file t)

  ;; Ensure we have use-package.
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  
  (eval-when-compile
    (require 'use-package))
  (require 'diminish)                ;; if you use :diminish
  (require 'bind-key)
  (require 'tealeg-speed-daemon
	   "~/.emacs.d/lisp/tealeg-speed-daemon.el")
  (require 'tealeg-packages
	   "~/.emacs.d/lisp/tealeg-packages.el")
  (require 'tealeg-backups
	   "~/.emacs.d/lisp/tealeg-backups.el")
  (require 'tealeg-font
	   "~/.emacs.d/lisp/tealeg-font.el")

  )
;;  (load-file "/home/tealeg/.emacs.d/lisp/tealeg-packages.el"))

;;   (require 'tealeg-packages)
;;   (require 'sauron)
;;   (require 'tealeg-customize)
;;   (require 'tealeg-autocompile)
;;   (require 'tealeg-complete)
;;   (require 'tealeg-backups)
;;   (require 'tealeg-crypto)
;;   (require 'tealeg-frame)
;;   (require 'tealeg-font)
;;   (require 'tealeg-file)
;;   (require 'tealeg-gnus)
;;   (require 'tealeg-unicode)
;;   (require 'tealeg-spelling)
;;   (require 'tealeg-shell)
;;   (require 'tealeg-check) ;; Needs flycheck
;;   (require 'landscape)
;;   (require 'tealeg-vc)
;;   (require 'tealeg-calendar)
;;   (require 'tealeg-elisp)
;;   (require 'tealeg-lisp)
;;   (require 'tealeg-go) ;; Needs go-mode
;;   (require 'tealeg-js)
;;   (require 'tealeg-xml)
;;   (require 'tealeg-html)
;;   (require 'tealeg-org)
;;   (require 'tealeg-irc)
;;   (require 'tealeg-python)
;;   (require 'tealeg-automode)
;;   (require 'tealeg-keybindings)
;;   (require 'tealeg-theme-setup)
;;   (require 'tealeg-mouse)
;; ;;  (require 'tealeg-modeline)
;;   (require 'tealeg-ido)
;;   (require 'tealeg-project)
;;   (require 'tealeg-landscape)
;;   )

(server-start)
;; (sauron-start)
(provide 'init)
;;; init.el ends here


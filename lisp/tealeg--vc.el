;;; tealeg--vc -- configure Emacs to use version control
;;;
;;; Commentary:
;;;	Setup magit, mainly.
;;;
;;; Code:

(straight-use-package 'magit)
;; (straight-use-package 'pinentry)

;; ;; Enable loopback so that pinentry will pop up in emacs
;; (setq epa-pinentry-mode 'loopback)
;; (pinentry-start)
;; ;; Start GPG agent with SSH support
;; (shell-command "gpg-connect-agent /bye")


(provide 'tealeg--vc)
;;; tealeg-vc.el ends here.

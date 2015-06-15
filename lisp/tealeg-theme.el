;;; tealeg-theme --- my theme settings.
;;;
;;; Commentary:
;;;     Theme setup

;;; Code:

(defvar tealeg-global-theme 'plan9
	"The theme to apply at startup.")

(defun tealeg-theme-customisation ()
	"Do some tweaks to frame appearance."
	(require 'tealeg-irc)
	(set-face-font 'mode-line "Ubuntu-12")
	(set-face-font 'mode-line-inactive "Ubuntu-12")
	(set-face-font 'variable-pitch "Ubuntu-12")
	(set-face-font 'erc-timestamp-face "Ubuntu Mono-10")
	(set-face-font 'erc-default-face "Ubuntu-12")
	)

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
							(load-theme tealeg-global-theme t)
							(tealeg-theme-customisation))))
	(progn
		(load-theme tealeg-global-theme t)
		(tealeg-theme-customisation)))

(provide 'tealeg-theme)
;;; tealeg-theme.el ends here

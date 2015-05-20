;;; tealeg-theme --- my theme settings.
;;;
;;; Commentary:
;;;     Theme setup

;;; Code:

(defvar tealeg-global-theme 'minimal-light
	"The theme to apply at startup.")

(defun tealeg-theme-customisation ()
	"Do some tweaks to frame appearance."
	(require 'powerline)
	(require 'tealeg-irc)
	(powerline-default-theme)
	(set-face-font 'mode-line "Gillius ADF-12")
	(set-face-font 'mode-line-inactive "Gillius ADF-12")
	(set-face-background 'mode-line "grey25")
	(set-face-foreground 'mode-line "white")
	(set-face-foreground 'mode-line-emphasis "white")
	(set-face-background 'mode-line-emphasis "dark slate grey")
	(set-face-bold 'mode-line-emphasis t)
	(set-face-foreground 'mode-line-highlight "black")
	(set-face-background 'mode-line-highlight "gray60")
	(set-face-attribute 'mode-line-highlight nil
											:box '(:line-width 1 :color "gray80" :style "released-button"))
	(set-face-background 'powerline-active1 "grey40")
	(set-face-background 'powerline-active2 "grey60")
	(set-face-background 'powerline-inactive1 "grey80")
	(set-face-background 'powerline-inactive2 "grey70")
	(set-face-font 'variable-pitch "Gillius ADF-15")
	(set-face-font 'erc-timestamp-face "Latin Modern Mono-10")
	(set-face-font 'erc-default-face "Latin Modern Mono-15")
	(set-face-foreground 'erc-notice-face "orange"))

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

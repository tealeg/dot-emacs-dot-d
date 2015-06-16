;;; tealeg-theme --- my theme settings.
;;;
;;; Commentary:
;;;     Theme setup

;;; Code:

(defvar tealeg-global-theme 'plan9
	"The theme to apply at startup.")


(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
							(load-theme tealeg-global-theme t))))
	(progn
		(load-theme tealeg-global-theme t)))

(provide 'tealeg-theme)
;;; tealeg-theme.el ends here

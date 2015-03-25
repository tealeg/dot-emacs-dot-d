;;; tealeg-theme --- my theme settings.
;;;
;;; Commentary:
;;;     Theme setup

;;; Code:

(defvar tealeg-global-theme 'minimal-light
	"The theme to apply at startup.")

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
                (load-theme tealeg-global-theme t))))
    (load-theme tealeg-global-theme t))

(provide 'tealeg-theme)
;;; tealeg-theme.el ends here

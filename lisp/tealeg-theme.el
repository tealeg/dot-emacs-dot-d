;;; tealeg-theme --- my theme settings.
;;;
;;; Commentary:
;;;     Theme setup

;;; Code:

(defvar tealeg-global-day-theme 'minimal-light
	"The theme to apply to new frames during daylight hours.")

(defvar tealeg-global-night-theme 'ample
  "The theme to apply to new frames during nighttime hours.")

(defun tealeg-load-theme ()
  "Depending on the time of day, load an appropriate colour theme."
  (let* ((time (decode-time))
         (hour (nth 2 time)))
    (if (and (> hour 7) (< hour 18))
        (load-theme tealeg-global-day-theme t)
      (load-theme tealeg-global-night-theme t))))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (tealeg-load-theme))))
  (tealeg-load-theme))


(provide 'tealeg-theme)
;;; tealeg-theme.el ends here

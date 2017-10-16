;;; tealeg-theme-setup --- my theme settings.
;;;
;;; Commentary:
;;;     Theme setup

;;; Code:

;;; Good candidates: minimal-light, Andreas, greiner, high-contrast, katester, leuven, montz, ramangalahy, scintilla, tango, vim-colors, xemacs

(defvar tealeg-global-day-theme 'tao-yang
	"The theme to apply to new frames during daylight hours.")

;;; Good candidates: minimal, arjen-grey, gruvbox, charcoal-black, desert, green-phosphor, hemisu-dark, lawrence, monokai, peacock, railscast, reykjavik, solarized-dark, tango-dark, ubuntu, wombat,
(defvar tealeg-global-night-theme 'tao-yin
  "The theme to apply to new frames during nighttime hours.")

(defun tealeg-load-theme ()
  "Depending on the time of day, load an appropriate colour theme."
  (interactive)
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

(provide 'tealeg-theme-setup)
;;; tealeg-theme-setup.el ends here

;;; tealeg-font --- my font settings.
;;;
;;; Commentary:
;;;     Font setup

;;; Code:

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (setq font-use-system-font nil)
                  (set-frame-font "Computer Modern-8:style=Typewriter")
                  (set-face-font 'variable-pitch "Computer Modern-8:style=Variable Width Typewriter")
                  ))))

(provide 'tealeg-font)
;;; tealeg-font.el ends here

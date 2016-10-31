
;;; tealeg-font --- my font settings.
;;;
;;; Commentary:
;;;     Font setup

;;; Code:


(defmacro tealeg-set-base-fonts (frame variable-pitch)
  "Set the baseline fonts (FRAME and VARIABLE-PITCH)."
  `(progn
     (set-frame-font ,frame)
     (set-face-font 'variable-pitch ,variable-pitch)))


(defmacro tealeg-deffs (name frame variable-pitch &rest body)
  "Define a function to set fonts as NAME, that will use FRAME as the frame font and VARIABLE-PITCH.  Optionally a BODY form can be passed in to be added to the tail of the function (to set other faces, for example."
    `(defun ,name ()
       (interactive)
       (tealeg-set-base-fonts ,frame ,variable-pitch)
       ,@body))

(tealeg-deffs tealeg-fs-ubuntu "Ubuntu Mono-10" "Ubuntu-10")
(tealeg-deffs tealeg-fs-google "Cousine-10" "Arimo-10")
(tealeg-deffs tealeg-fs-arial "Arial Monospaced MT Std-7" "Arial-7")
(tealeg-deffs tealeg-fs-nk57 "NK57Monospace-7" "NK57Monospace-7")



(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (setq font-use-system-font nil)
                  (tealeg-fs-google)
                  ))))

(provide 'tealeg-font)
;;; tealeg-font.el ends here

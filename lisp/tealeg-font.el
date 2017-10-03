;;; tealeg-font --- my font settings.
;;;
;;; Commentary:
;;;     Font setup

;;; Code:

;; specify font for all unicode characters
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))

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


;; (tealeg-deffs tealeg-fs-ubuntu "Ubuntu Mono-12" "Ubuntu-12")
;; (tealeg-deffs tealeg-fs-arial "Arial Monospaced MT Std-7" "Arial-7")
;; (tealeg-deffs tealeg-fs-nk57 "NK57Monospace-7" "NK57Monospace-7")
(tealeg-deffs tealeg-fs-go "Go Mono-15" "Go-15")
(tealeg-deffs tealeg-fs-menlo "Menlo-15" "Menlo-15")
(tealeg-deffs tealeg-fs-monaco "Monaco-15" "Monaco-15")
(tealeg-deffs tealeg-fs-iosevka-term "Iosevka Term-15" "Iosevka Term-15")



(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (setq font-use-system-font nil)
                  (tealeg-fs-iosevka-term)
                  )))
  (tealeg-fs-iosevka-term))

(provide 'tealeg-font)
;;; tealeg-font.el ends here

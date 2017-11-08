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
(tealeg-deffs tealeg-fs-go "Go Mono-11" "Go-11")
(tealeg-deffs tealeg-fs-menlo "Menlo-15" "Menlo-11")
(tealeg-deffs tealeg-fs-monaco "Monaco-15" "Monaco-11")
(tealeg-deffs tealeg-fs-iosevka-term "Iosevka Term Medium-16" "Iosevka Term Medium-16")
(tealeg-deffs tealeg-fs-special-elite "Special Elite-16" "Special Elite-16")
(tealeg-deffs tealeg-fs-traveling-typewriter "Traveling_Typewriter-16" "Traveling_Typewriter-16")
(tealeg-deffs tealeg-fs-libertinus "Libertinus Mono-16" "Libertinus Mono-16")
(tealeg-deffs tealeg-fs-telegrama "Telegrama-16" "Telegrama-16")
(tealeg-deffs tealeg-fs-latin "Latin Modern Mono-16" "Latin Modern Mono-16")
(tealeg-deffs tealeg-fs-arial "Arial Monospaced MT-14" "Arial Monospaced MT-14")
(tealeg-deffs tealeg-fs-cherry "Cherry-14" "Cherry-14")
(tealeg-deffs tealeg-fs-f25 "F25 Bank Printer-14" "F25 Bank Printer-14")
(tealeg-deffs tealeg-fs-unispace "Unispace-14" "Unispace-14")
(tealeg-deffs tealeg-fs-pro "ProFontWindows-16" "ProFontWindows-16")
(tealeg-deffs tealeg-fs-didot "Didot-16" "Didot-16")
(tealeg-deffs tealeg-fs-futura "Futura-16" "Futura-16")
(tealeg-deffs tealeg-fs-lispM "LispM-18" "LispM-18")
(tealeg-deffs tealeg-fs-pocket-calculator "Pocket Calculator-24" "Pocket Calculator-24")
(tealeg-deffs tealeg-fs-hermit "Hermit-18" "Hermit-18")
(tealeg-deffs tealeg-fs-neoletters "neoletters-15" "neoletters-15")

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

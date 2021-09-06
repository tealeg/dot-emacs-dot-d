;;; tealeg-animate -- provide animated forms for my amusement
;;;
;;; Commentary:
;;;    Because I can.
;;;
;;; Code:

(defun animate-fortune ()
  "Animated fortune display."
  (interactive)
  (animate-sequence (split-string (shell-command-to-string "fortune") "\n") 1))

(provide 'tealeg-animate)
;;; tealeg-animate.el ends here

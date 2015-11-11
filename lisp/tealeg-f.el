;;; tealeg-f --- Miscellanious functions
;;;
;;; Commentary:
;;;     - I got nuttin'
;;; Code:

(require 'thingatpt)

(defun capitalize-first-char ()
  "Capitalize the first char in a word, leaving the rest intact."
  (interactive)
  (save-excursion
    (upcase-initials-region (beginning-of-thing 'word) (end-of-thing 'word))))

(provide 'tealeg-f)
;;; tealeg-f.el ends here

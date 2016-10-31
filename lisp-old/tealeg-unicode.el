;;; tealeg-unicode --- my unicode settings.
;;;
;;; Commentary:
;;;     Unicode setup

;;; Code:

(defun find-char (match)
  "Print all Unicode chars up to 2^16 that match 'MATCH'."
  (interactive "Mmatch string:")
  (with-current-buffer-window
   (concat "*find chars: `" match "` *")
   nil
   nil
   (let ((count 0))
     (mapc
      (lambda (x)
        (let ((nn (get-char-code-property x 'name)))
          (when
              (and (not (null nn))
                   (string-match match nn))
            (insert-char x)
            (insert " " nn "\n")
            (incf count)
            ) ) )
      (number-sequence 0 (expt 2 16)))
     (if (not (= count 1))
         (insert (number-to-string count) " matches found.\n")
       (insert "1 match found.\n")))))

(provide 'tealeg-unicode)
;;; tealeg-unicode.el ends here


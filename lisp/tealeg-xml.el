;;; tealeg-xml --- my xml settings.
;;;
;;; Commentary:
;;;     Xml setup

;;; Code:
(defun tidy-xml ()
  "Format and indent XML files."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "><" nil t)
      (replace-match "> <" nil t))
    (goto-char (point-min))
    (let ((more-lines t))
      (while more-lines
        (indent-according-to-mode)
        (setq more-lines (= 0 (forward-line 1)))))))


(provide 'tealeg-xml)
;;; tealeg-xml.el ends here

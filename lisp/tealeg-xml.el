;;; tealeg-xml --- my xml settings.
;;;
;;; Commentary:
;;;     Xml setup

;;; Code:


(defun -xml-remove-leading-material ()
  "Remove leading material from an XML snippet."
  (goto-char (point-min))
  (if (not (null (search-forward "<" nil t)))
      (kill-region (point-min) (match-beginning 0))))

(defun -xml-remove-trailing-material ()
  "Remove trailing material from an XML snippet."
    (goto-char (point-max))
    (if (not (null (search-backward ">" nil t)))
        (kill-region (match-end 0) (point-max))))

(defun -xml-remove-gocheck-detritus ()
  "Remove detritus specific to gecheck assertion output."
  (goto-char (point-min))
  (if (not (null (search-forward "\\n\" \+\n\.\.\.     \"" nil t)))
      (progn
        (kill-region (match-beginning 0) (match-end 0))
        (newline)))
  (goto-char (point-min))
  (while (search-forward "\\\"" nil t)
    (replace-match "\"" nil t)))

(defun -xml-line-break-between-tags ()
  "Place line breaks between adjascent tags."
    (goto-char (point-min))
    (while (search-forward "[[:space:]]*" nil t)
      (replace-match " " nil t)))

(defun -xml-indent-lines ()
  "Indent the XML."
  (goto-char (point-min))
  (let ((more-lines t))
    (while more-lines
      (indent-according-to-mode)
      (setq more-lines (= 0 (forward-line 1))))))

(defun tidy-xml ()
  "Format and indent XML files."
  (interactive)
  (save-excursion
    (-xml-remove-leading-material)
    (-xml-remove-trailing-material)
    (-xml-remove-gocheck-detritus)
    (-xml-line-break-between-tags)
    (-xml-indent-lines)))

(provide 'tealeg-xml)
;;; tealeg-xml.el ends here

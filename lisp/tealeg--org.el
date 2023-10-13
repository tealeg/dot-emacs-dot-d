(require 'org)

(add-hook 'org-font-lock-hook #'tealeg/org-indent-quotes)

(defun tealeg/org-indent-quotes (limit)
  (let ((case-fold-search t))
    (while (search-forward-regexp "^[ \t]*#\\+begin_quote" limit t)
      (let ((beg (1+ (match-end 0))))
        ;; on purpose, we look further than LIMIT
        (when (search-forward-regexp "^[ \t]*#\\+end_quote" nil t)
          (let ((end (1- (match-beginning 0)))
                (indent (propertize "    " 'face 'org-hide)))
            (add-text-properties beg end (list 'line-prefix indent
                                               'wrap-prefix indent
					       'face 'org-quote))))))))


(provide 'tealeg--org)

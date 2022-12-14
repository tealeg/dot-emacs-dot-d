

(defun include-example ()
  (interactive)
     (let ((path (string-replace "reference/" "~/src/upvest/public-api/api/" (progn
                   (re-search-forward "json path=\"\\(.*?\\)\"")
                   (match-string 1)))))
       (beginning-of-line)
       (kill-line)
       (insert "```")
       (newline)
       (newline)
       (insert "```")
       (backward-char 4)
       (insert-file-literally path)
       ))
    


(provide 'tealeg--macro)

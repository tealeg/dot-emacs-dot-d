(defun migrate-callouts ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "<Callout type=\"\\(.*\\)\".*>" "\n\n{% admonition type=\"\\1\" %}\n" nil)
    (goto-char (point-min))
    (replace-regexp "</Callout>" "\n{% /admonition %}\n\n" nil)
    ))



(defun migrate-tabs ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (query-replace-regexp "<Tabs>" "{% tabs %}" nil)
    (goto-char (point-min))
    (query-replace-regexp "</Tabs>" "{% /tabs %}" nil)
    (goto-char (point-min))
    (query-replace-regexp "<Tab title=\"\\(.*\\)\".*>" "{% tab label=\"\\1\" %}" nil)
    (goto-char (point-min))
    (query-replace-regexp "</Tab>" "{% /tab %}" nil)
    ))


(defun migrate-grid ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (query-replace-regexp "<Grid.*cols=\"\\(.*?\\)\".*>" "{% cards columns=\"\\1\" %}" nil)
    (goto-char (point-min))
    (query-replace-regexp "</Grid>" "{% /cards %}")))


(defun replace-card ()
  (if (re-search-forward "<Card[^s]" nil t)
      (progn
        (let ((cur (point))
              (card-start (- (point) 6)))
          (re-search-forward "</Card>")
          (let ((card-end (point))
                (card-end-start (- (point) 7)))
            (goto-char cur)
            (re-search-forward "href=\"\\(.*?\\)\"" card-end-start t)
            (let ((to (match-string 1)))
              (goto-char cur)
              (re-search-forward "<Image.*src=\"\\(.*?\\)\".*/>" card-end-start t)
              (let ((icon (match-string 1)))
                (re-search-forward "^#* \\(.*\\)$" card-end-start t)
                (let ((title (match-string 1))
                      (text (buffer-substring (point) card-end-start)))
                  (delete-region card-start card-end)
                  (goto-char card-start)
                  (insert "{% card to=\"" to "\" icon=\"" icon "\" title=\"" title "\" %}")
                  (newline)
                  (insert text)
                  (newline)
                  (insert "{% /card %}")
                  (newline))
                ))))
        t)
    nil))

(defun migrate-card ()
  (interactive)
  (goto-char (point-min))
  (while (replace-card)
    (message "."))
  ) 
        


(defun migrate-api-links ()
  (interactive)
  (goto-char (point-min))
  (replace-regexp "/api/\\(.*?\\)#\\(.*?\\)" "/api/release/upvest-investment-api.v1-1/\\1/\\2" nil))
  ;; (if (re-search-forward "/api/.*#.*" nil t)
  ;;     (progn
  ;;       (let ((cur (point))
  ;;             (link-start (- (point) 5)))
  ;;         (re-search-forward ")\\| ")
  ;;         (let ((link-end (- (point) 1)))
  ;;           (message (buffer-substring link-start link-end))))
  ;;       t)
  ;; nil))
             

(defun make-rewrite-table ()
  (interactive)

  (with-temp-buffer
    (insert-file-contents "~/src/upvest/public-api/services/redocly/api/release/Upvest-Investment-API.v1.json")
    (let ((tbl (make-hash-table :test 'equal :weakness nil)))
      (goto-char (point-min))
      (while (re-search-forward "operationId\": *\"\\(.*?\\)\"" nil t)
        (let ((oid (match-string 1)))
          (re-search-forward "summary\": *\"\\(.*?\\)\"" nil t)
          (let ((summary (match-string 1)))
            (puthash (string-replace " " "_" (downcase summary)) oid tbl))))
      tbl)))

(defvar rewrite-tbl (make-rewrite-table))


(defun migrate-api-links ()
   (interactive)

  (goto-char (point-min))
  (while (re-search-forward "(/api/\\(.*?\\)#\\(.*?\\))" nil t)
    (let* ((tag (match-string 1))
           (description (string-replace "-" "_" (match-string 2)))
           (heading (gethash description rewrite-tbl description))
           (url-end (- (point) 1))
           (url-start (- (point) (+ 7 (length tag) (length description)))))
      (message (concat "Tag: " tag ", Description: " description ", Heading: " heading))
      (delete-region url-start url-end)
      (goto-char url-start)
      (insert (concat "/api/release/upvest-investment-api.v1-1/" (downcase tag) "/" heading))
  t)))
           
      

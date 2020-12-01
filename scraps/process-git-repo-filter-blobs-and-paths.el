(defun make-sha-list ()
  (interactive)
  (with-current-buffer (current-buffer)
    (save-excursion
      (goto-char (point-min))
      (forward-line 2)
      (let ((buff (generate-new-buffer "blob-shas.txt")))
	(while (forward-line 1)
	  (if (not (eq (point-max) (point)))
	      (write-sha-line (humanise-line) buff)))))))


(defun make-table-with-human-readable-sizes ()
    (interactive)
    (with-current-buffer (current-buffer)
      (save-excursion
	(goto-char (point-min))
	(forward-line 2)
	(let ((buff (generate-new-buffer "top-blobs.txt")))
	  (while (forward-line 1)
	    (if (not (eq (point-max) (point)))
		(write-human-line (humanise-line) buff))
	    )))))

(defun write-sha-line (hline buff)
  (with-current-buffer buff
    (insert (car hline))
    (newline)))

(defun write-human-line (hline buff)
  (with-current-buffer buff
    (insert "| ")
    (insert (car hline))
    (insert " | ")
    (insert (cadr hline))
    (insert " | ")
    (insert (caddr hline))
    (insert " | ")
    (insert (cadddr hline))
    (insert " |")
    (newline)))
	    
(defun humanise-line ()
  (interactive)
  (forward-line 0)
  (let* ((bol (save-excursion
		(beginning-of-line)
		(point)))
	 (eol (save-excursion
	       (end-of-line)
	       (point)))
	 (sha  (string-trim (buffer-substring bol (+ bol 41))))
	 (unpacked-bytes (format "%.2fMiB" (/ (string-to-number (string-trim (buffer-substring (+ bol 42) (+ bol 53)))) 1048576.0)))
	 (packed-bytes (format "%.2fMiB" (/ (string-to-number (string-trim (buffer-substring (+ bol 53) (+ bol 64)))) 1048576.0)))
	 (object (buffer-substring (+ bol 65) eol)))
    (list sha unpacked-bytes packed-bytes object)))


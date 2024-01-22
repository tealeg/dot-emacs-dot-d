(use-package eldoc-box)
(require 'sh-script)


;; 123 is the { symbol
(defconst tealeg--open-brace 123)
;; 125 is the } symbol
(defconst tealeg--close-brace 125)
;; 36 is the $ symbol
(defconst tealeg--dollar 36)
;; 34 is the " symbol
(defconst tealeg--double-quote 34)


(defun tealeg--char-at-point-eq (charcode)
  "Returns t if the character after the point matches the charcode."
  (char-equal (char-after) charcode))

(defun tealeg--bash-dollar-p ()
  "Returns t if the character after the point is a $"
  (tealeg--char-at-point-eq tealeg--dollar))

(defun tealeg--bash-open-brace-p ()
  "Returns t if the character after the point is a {"
  (tealeg--char-at-point-eq tealeg--open-brace))

(defun tealeg--bash-close-brace-p ()
  "Returns t if the character after the point is a }"
  (tealeg--char-at-point-eq tealeg--close-brace))

(defun tealeg--bash-double-quote-p ()
  "Returns t if the character after the point is a  \""
  (tealeg--char-at-point-eq tealeg--double-quote))

(defun tealeg--bash-find-preceding-dollar ()
  "Move the point backwards until we find a dollar."
  (if (tealeg--bash-dollar-p)
    (point)
    (if (= (point) (point-min))
	(error "No dollar referenced variable found at or before point")
      (backward-char)
      (tealeg--bash-find-preceding-dollar))))
    
(defun tealeg--bash-string-wrap-var ()
  (interactive)
  (save-excursion
    (let ((dollar-point (tealeg--bash-find-preceding-dollar)))
      (forward-char)
      (unless (tealeg--bash-open-brace-p)
	(insert-char tealeg--open-brace))
      (forward-sexp)
      (unless (or (tealeg--bash-close-brace-p)
		  (save-excursion
		    (backward-char)
		    (tealeg--bash-close-brace-p)))
	(insert-char tealeg--close-brace))
      (unless (tealeg--bash-double-quote-p)
	(insert-char tealeg--double-quote))
      (goto-char dollar-point)
      (unless (tealeg--bash-double-quote-p)
	(insert-char tealeg--double-quote)))))

	  
(defun tealeg--sh-mode-helper-f ()
  (sh-set-shell "/bin/bash")
  (bind-key "C-x \"" #'tealeg--bash-string-wrap-var sh-mode-map)
  (eglot)
  ;; (eldoc-box-hover-mode 1)
  (eldoc-box-hover-at-point-mode 1)
  )

(add-hook 'sh-mode-hook #'tealeg--sh-mode-helper-f)

(provide 'tealeg--bash)

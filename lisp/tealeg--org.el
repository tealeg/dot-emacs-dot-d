(require 'org)
(require 'org-tempo)
(require 'ox)

;; (use-package ox-html5slide) // no longer works
;; (use-package ox-tufte)
(use-package ox-reveal)
;; (use-package ox-spectacle)
;; (use-package ox-yaow)
(use-package ox-slack)
;; (use-package ox-ioslide) // seems broken

(use-package org-present
  :config 
  (progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

(use-package svg-tag-mode
  :config (progn
	    (setq svg-tag-tags
		  '(("DEADLINE:" . ((lambda (tag) (svg-tag-make "DEADLINE"))))
		    ("SCHEDULED:" . ((lambda (tag) (svg-tag-make "SCHEDULED"))))
		    ))))

(add-hook 'org-mode-hook #'svg-tag-mode)

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

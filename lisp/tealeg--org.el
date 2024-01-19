
;; Second Brain
(use-package org-roam
  :elpaca t
  :after (org)
  :custom (org-roam-directory "~/org-tree")
  :bind (("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point)
	 )
  :config (progn
	    (org-roam-setup)
	    (org-roam-db-autosync-mode))
  )



;; Presentation
(use-package ox-reveal
  :after (org))

(use-package org-present
  :after (org)
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

;; Prettiness
(use-package svg-tag-mode
  :after (org)
  :config (progn
	    (setq svg-tag-tags
		  '(("DEADLINE:" . ((lambda (tag) (svg-tag-make "DEADLINE"))))
		    ("SCHEDULED:" . ((lambda (tag) (svg-tag-make "SCHEDULED"))))
		    )))
  :hook ((org-mode-hook . svg-tag-mode)
	 (org-font-lock-hook . tealeg/org-indent-quotes))
  )


(elpaca nil
  (require 'org)
  (require 'org-macs)
  (require 'org-id)
  (require 'org-tempo)
  (require 'org-agenda)
  (require 'org-clock)
  (require 'ox)
  
  ;; Time clock
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  ;; Agenda
  (setq org-agenda-files (list "~/org-tree"))


  (bind-keys ("C-c a" . org-agenda))
  
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
						 'face 'org-quote)))))))))





(provide 'tealeg--org)

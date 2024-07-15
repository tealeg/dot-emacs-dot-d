
(use-package org
  :config
  (setq org-agenda-files
        '("~/org-tree"))
  (setq org-hide-emphasis-markers t)
  (setq org-todo-keywords
        '((sequence "IDEA" "VALIDATED" "IN PROGRESS" "BLOCKED" "|" "DONE" "CANCELLED")))
  )

(use-package org-modern
  :ensure t
  :after org
  :config
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
 
   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ─────────────────────────────────────────────────")

  ;; Ellipsis styling
  (setq org-ellipsis "…")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
  
  (global-org-modern-mode 1))

(provide 'tealeg--org)

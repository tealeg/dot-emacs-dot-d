

(use-package org
  :config
  (setq org-agenda-files
        '("~/org-tree"))
  (setq org-hide-emphasis-markers t)
  (setq org-todo-keywords
        '((sequence "IDEA" "VALIDATED" "IN-PROGRESS" "BLOCKED" "|" "DONE" "CANCELLED")))
  (setq org-tag-alist
        '(
          ;; Top level tags
          ("initiative" . ?i)
          ("devrel" . ?d)
          ("people" . ?p)

          ;; DevRel tags
          ("blog" . ?b)
          ("podcast" . ?c)
          ("speaking" . ?s)
          ("sponsoring" . ?S)
          ("exhibiting" . ?e)
          ("social_media" . ?m)

          ;; People tags
          ("mentoring" . ?M)
          ("DEIB" . ?D)
          ("early_phase" . ?E)

          ;; Iniatives
          ("onboarding")
          ("spec_or_dsl")))
          
          
         
          
          
  (require 'ox-latex)
  (setq org-latex-compiler "xelatex")


;;   (defun tealeg--map-todo-type-to-background
;;       (todo-type)
;;     "Map a todo-type to a background color."
;;     (cond ((string= todo-type "todo") "paleblue")
;;           ((string= todo-type "done")  "ultramarine")
;;           (t "navy")))
    
;;   (defun tealeg--map-todo-type-to-color
;;       (todo-type)
;;     "Map a todo-type to a color."
;;     "white")
;;     ;; (cond ((string= todo-type "TODO") "paleblue")
;;     ;;       (t "navy")))


  
  (defun tealeg--org-latex-format-headline-function
    (todo _todo-type priority text tags _info)
  "Default format function for a headline.
See `org-latex-format-headline-function' for details."
  text)
;;    "\\begin{tcbitemize}
;;    \\tcbitem"
;;    text
;;    (and todo (format "\\tcbitem
;; [colback=%s!5!%s]
;; %s
;;  "
;;                      (tealeg--map-todo-type-to-background _todo-type)
;;                      (tealeg--map-todo-type-to-color _todo-type)
;;                      todo))
;;    (and priority (format "\\tcbitem[colback=red!5!white]
;; \\#%c
;; " priority))
;;    (and tags
;; 	    (format "\\tcbitem[colback=green!5!white]
;; \\textsc{%s}
;; "
;; 		    (mapconcat #'org-latex--protect-text tags ":")))
;;    "\\end{tcbitemize}
;; "
;;    ))

  (custom-set-variables '(org-latex-format-headline-function #'tealeg--org-latex-format-headline-function))
  )

;; (use-package org-modern
;;   :ensure t
;;   :after org
;;   :config
;;   (setq
;;    ;; Edit settings
;;    org-auto-align-tags nil
;;    org-tags-column 0
;;    org-catch-invisible-edits 'show-and-error
;;    org-special-ctrl-a/e t
;;    org-insert-heading-respect-content t

;;    ;; Org styling, hide markup etc.
;;    org-hide-emphasis-markers t
;;    org-pretty-entities t
 
;;    ;; Agenda styling
;;    org-agenda-tags-column 0
;;    org-agenda-block-separator ?─
;;    org-agenda-time-grid
;;    '((daily today require-timed)
;;      (800 1000 1200 1400 1600 1800 2000)
;;      " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
;;    org-agenda-current-time-string
;;    "◀── now ─────────────────────────────────────────────────")

;;   ;; Ellipsis styling
;;   (setq org-ellipsis "…")
;;   (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
  
;;   (global-org-modern-mode 1))

(use-package svg-tag-mode
  :config
  (setq svg-tag-tags '(("^TODO" (svg-tag-make "TODO"))
                       (":initiative"  (svg-tag-make "INITIATIVE"))
                       (":devrel" (svg-tag-make "DEVREL"))
                       (":people" (svg-tag-make "PEOPLE"))

                       ;; DevRel tags
                       (":blog" (svg-tag-make "BLOG"))
                       (":podcast" (svg-tag-make "PODCAST"))
                       (":speaking" (svg-tag-make "SPEAKING"))
                       (":sponsoring" (svg-tag-make "SPONSORING"))
                       (":exhibiting" (svg-tag-make "EXHIBITING"))
                       (":social_media" (svg-tag-make "MEDIA"))

                       ;; People tags
                       (":mentoring" (svg-tag-make "MENTORING"))
                       (":DEIB" (svg-tag-make "DEIB"))
                       (":early_phase" (svg-tag-make "PHASE"))

                       ;; Initiatives
                       (":onboarding" (svg-tag-make "ONBOARDING"))
                       (":spec_or_dsl" (svg-tag-make "SPEC/DSL"))))

  (global-svg-tag-mode 1))
        


(provide 'tealeg--org)

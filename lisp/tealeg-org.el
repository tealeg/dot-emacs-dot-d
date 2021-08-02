;;; tealeg-org -- setup org mode
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'org-plus-contrib)
(straight-use-package 'org-bullets)


(require 'org)
(require 'org-agenda)
(require 'org-capture)
(require 'org-bullets)
(require 'org-tempo)
(require 'ox-md)
(require 'flyspell)
(require 'face-remap)

(if (file-exists-p "~/src/hdi/DX/c3-devcare-org/")
    (progn
      (add-to-list 'load-path "~/src/hdi/DX/c3-devcare-org/")
      (require 'hdi-c3-devcare-config)))

(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


(let* ((variable-tuple
	
        (cond
	 ((x-list-fonts "IBM Plex Serif")         '(:font "IBM Plex Serif"))
	 ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
         ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
         ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
         ((x-list-fonts "Verdana")         '(:font "Verdana"))
         ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
         (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color :family "Rye")))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))


(defun org-mode-helper-f ()
  "Setup 'org-mode'."
  (flyspell-mode 1)
  (variable-pitch-mode 1)
;;  (org-indent-mode 1)
  (visual-line-mode 1)
  (org-bullets-mode 1)

  )

(add-hook 'org-mode-hook 'org-mode-helper-f)

(provide 'tealeg-org)
;;; tealeg-org.el ends here

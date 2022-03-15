;;; tealeg--completion -- set up fancy completion
;;;
;;; Commentary:
;;;	We're not using helm or anything else like that.  Just some oldschool hippie-expand ;-)
;;;
;;; Code:


(straight-use-package '(hippie-completing-read :type git :host github :repo "duckwork/hippie-completing-read"))
(straight-use-package 'corfu)
(straight-use-package 'cape)
(straight-use-package 'kind-icon)
(straight-use-package '(corfu-doc :type git :host github :repo "galeo/corfu-doc"))

(require 'hippie-exp)
(require 'hippie-completing-read)


(dolist (binding `(("C-c p p" . completion-at-point) ;; capf
                  ("C-c p t" . complete-tag)        ;; etags
                  ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
                  ("C-c p f" . cape-file)
                  ("C-c p k" . cape-keyword)
                  ("C-c p s" . cape-symbol)
                  ("C-c p a" . cape-abbrev)
                  ("C-c p i" . cape-ispell)
                  ("C-c p l" . cape-line)
                  ("C-c p w" . cape-dict)
                  ("C-c p \\" . cape-tex)
                  ("C-c p _" . cape-tex)
                  ("C-c p ^" . cape-tex)
                  ("C-c p &" . cape-sgml)
                  ("C-c p r" . cape-rfc1345)))
  (progn
    (global-set-key (kbd (car binding)) (cdr binding))
    (add-to-list 'completion-at-point-functions (cdr binding))
        ))

./

(require 'kind-icon)
(setq kind-icon-use-icons t
      kind-icon-default-face 'corfu-default
      )

(add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
(global-corfu-mode 1)
(corfu-doc-mode 1)
(global-set-key (kbd "\M- ") #'hippie-expand)
(global-set-key (kbd "M-/") #'hippie-completing-read)

(provide 'tealeg--completion)
;;; tealeg--completion.el ends here


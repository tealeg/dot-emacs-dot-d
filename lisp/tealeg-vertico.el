;;; tealeg-vertico -- configure vertico
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'vertico)
(straight-use-package 'orderless)
(straight-use-package 'savehist)
(straight-use-package 'marginalia)

(vertico-mode 1)
(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides '((fle (styles . partial-completion))))
(savehist-mode 1)
(marginalia-mode 1)

(global-set-key (kbd "M-A") #'marginalia-cycle)
(define-key minibuffer-local-map (kbd "M-A") #'marginalia-cycle)

(defun crm-indicator (arg)
  (cons (concat "[CRM] " (car args) (cdr args))))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(setq enable-recursive-minibuffers t)




(provide 'tealeg-vertico)
;;; tealeg-vertico.el ends here

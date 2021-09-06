;;; tealeg-vertico -- configure vertico
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'vertico)


(vertico-mode 1)

(setq vertico-cycle t)
(define-key vertico-map (kbd "C-j") #'vertico-next)
(define-key vertico-map (kbd "C-k") #'vertico-previous)
(define-key vertico-map (kbd "C-f") #'vertico-exit)
(define-key vertico-map "?" #'minibuffer-completion-help)
(define-key vertico-map (kbd "M-RET") #'minibuffer-force-complete-and-exit)
(define-key vertico-map (kbd "M-TAB") #'minibuffer-complete)

(defun crm-indicator (arg)
  (cons (concat "[CRM] " (car args) (cdr args))))
(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(setq enable-recursive-minibuffers t)


(provide 'tealeg-vertico)
;;; tealeg-vertico.el ends here

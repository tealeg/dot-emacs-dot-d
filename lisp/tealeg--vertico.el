;;; tealeg--vertico -- configure vertico completion
;;;
;;; Commentary:
;;;     Blah, blah, configure vertico
;;;
;;; Code:

;; Enable vertico
(straight-use-package 'vertico)

(require 'vertico)
(vertico-mode 1)

;; Different scroll margin
;; (setq vertico-scroll-margin 0)

;; Show more candidates
;; (setq vertico-count 20)

;; Grow and shrink the Vertico minibuffer
;; (setq vertico-resize t)

;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;; (setq vertico-cycle t)


;; ;; Optionally use the `orderless' completion style. See
;; ;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; ;; dispatcher. Additionally enable `partial-completion' for file path
;; ;; expansion. `partial-completion' is important for wildcard support.
;; ;; Multiple files can be opened at once with `find-file' if you enter a
;; ;; wildcard. You may also give the `initials' completion style a try.
;; (use-package orderless
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(straight-use-package 'savehist)
(require 'savehist)
(savehist-mode 1)

;; A few more useful configurations...
(straight-use-package 'emacs)
(require 'emacs)

;; Add prompt indicator to `completing-read-multiple'.
;; Alternatively try `consult-completing-read-multiple'.
(defun crm-indicator (args)
  (cons (concat "[CRM] " (car args)) (cdr args)))


(advice-add #'completing-read-multiple :filter-args #'crm-indicator)

;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; Enable recursive minibuffers
(setq enable-recursive-minibuffers t)

(provide 'tealeg--vertico)
;;; tealeg--vertico.el ends here

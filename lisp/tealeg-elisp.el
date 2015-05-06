;;; tealeg-elisp --- my elisp settings.
;;;
;;; Commentary:
;;;     Elisp setup

;;; Code:
(require 'paren)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)



(defvar electrify-return-match
	"[\]}\)\"]"
	"If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
	"If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
	(interactive "P")
	(let ((case-fold-search nil))
		(if (looking-at electrify-return-match)
				(save-excursion (newline-and-indent)))
		(newline arg)
		(indent-according-to-mode)))

;; Using local-set-key in a mode-hook is a better idea.
(global-set-key (kbd "RET") 'electrify-return-if-match)

(defun e-lisp-helpers ()
  "Setup 'emacs-lisp-mode'."
  (setq show-paren-style 'mixed)
  (setq truncate-lines t)
  (setq tab-width 2)
  (setq show-trailing-whitespacee t)
	(paredit-mode t)
	(turn-on-eldoc-mode)
	(eldoc-add-command
	 'paredit-backward-delete
	 'paredit-close-round)
	(local-set-key (kbd "RET") 'electrify-return-if-match)
	(eldoc-add-command 'electrify-return-if-match)
	(show-paren-mode t)
  (set-fill-column 79)
  (visual-line-mode 1))

(add-hook 'emacs-lisp-mode-hook 'e-lisp-helpers)
(add-hook 'ielm-mode-hook 'e-lisp-helpers)

(provide 'tealeg-elisp)
;;; tealeg-elisp.el ends here

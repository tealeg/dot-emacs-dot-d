;;; tealeg-elisp --- my elisp settings.
;;;
;;; Commentary:
;;;     Elisp setup

;;; Code:
(require 'paren)

(defun e-lisp-helpers ()
  "Setup 'emacs-lisp-mode'."
  (setq show-paren-style 'mixed)
  (setq truncate-lines t)
  (setq tab-width 2)
  (setq show-trailing-whitespace t)
  (eldoc-mode 1)
  (show-paren-mode 1)
  (set-fill-column 79)
  (visual-line-mode 1))

(add-hook 'emacs-lisp-mode-hook 'e-lisp-helpers)
(add-hook 'ielm-mode-hook 'e-lisp-helpers)

(provide 'tealeg-elisp)
;;; tealeg-elisp.el ends here

;;; tealeg-elisp -- configuration for Emacs lisp
;;;
;;; Commentary:
;;;
;;; Code:
(straight-use-package 'yasnippet)
(straight-use-package 'flycheck)
(straight-use-package 'flyspell)

(require 'elisp-mode)
(require 'flycheck)
(require 'flyspell)

(defun tealeg-elisp-helper-f ()
  "Setup 'emacs-lisp-mode'."
  (yas-minor-mode 1)
  (flycheck-mode 1)
  (flyspell-prog-mode)
  )

(add-hook 'emacs-lisp-mode-hook 'tealeg-elisp-helper-f)

(provide 'tealeg-elisp)
;;; tealeg-elisp.el ends here

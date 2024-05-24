(use-package flycheck)

(use-package elisp-lint
  :after flycheck
  :config
  (require 'eldoc)
  (defun tealeg--elisp-helper-f ()
      (eldoc-mode 1)
      (flycheck-mode 1))
  (add-hook 'emacs-lisp-mode-hook #'tealeg--elisp-helper-f))
    
(provide 'tealeg--elisp)

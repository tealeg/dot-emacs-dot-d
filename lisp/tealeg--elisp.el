(use-package flycheck
  :config
  (require 'eldoc)
  (defun tealeg--elisp-helper-f ()
      (eldoc-mode 1)
      (flycheck-mode 1))
  :hook (emacs-lisp-mode . tealeg--elisp-helper-f))
    
(provide 'tealeg--elisp)

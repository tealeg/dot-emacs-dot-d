(use-package eros)
(use-package inspector
  :after eros)
(use-package tree-inspector
  :after inspector)
(use-package eros-inspector
  :after tree-inspector)

(use-package flycheck
  :after eros-inspector
  :config
  (require 'elisp-mode)
  (require 'simple)
  (require 'eldoc)
  (require 'eros)
  (require 'tree-inspector)
  (require 'eros-inspector)

  (defun tealeg--elisp-helper-f ()
    (eros-mode 1)
    (eldoc-mode 1)
    (flycheck-mode 1))
  
  (defun eval-or-inspect-expression (arg)
    "Like `eval-expression', but also inspect when called with prefix ARG."
    (interactive "P")
    (pcase arg
      ('(4) (let ((current-prefix-arg nil))
	          (call-interactively #'eros-inspector-inspect-expression)))
      (_ (call-interactively #'eval-expression))))
  
  (defun eval-or-inspect-last-sexp (arg)
    "Like `eval-last-sexp', but also inspect when called with prefix ARG."
    (interactive "P")
    (pcase arg
      ('(4) (eros-inspector-inspect-last-sexp))
      (_ (call-interactively #'eval-last-sexp))))

  (define-key global-map [remap eval-last-sexp] #'eval-or-inspect-last-sexp)
  (define-key global-map [remap eval-expression] #'eval-or-inspect-expression)

  :hook (emacs-lisp-mode . tealeg--elisp-helper-f))

(provide 'tealeg--elisp)

(elpaca nil
  (require 'python)
  (require 'eglot)
  (require 'eldoc-box)

  (defun tealeg--python-helper-f ()
    (eglot-ensure)
    (eldoc-box-hover-at-point-mode 1))

  (add-hook 'python-mode-hook #'tealeg--python-helper-f))

(provide 'tealeg--python)

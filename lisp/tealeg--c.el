

(elpaca nil
  (require 'sideline)
  (require 'eglot)
  (require 'eldoc-box)

  (defun tealeg--c-mode-helper-f ()
    "Set up \"c-mode\"."
    (eldoc-box-hover-at-point-mode 1)
    (sideline-mode 1)
    (eglot-ensure))

  (add-hook 'c-mode-hook #'tealeg--c-mode-helper-f))

(provide 'tealeg--c)

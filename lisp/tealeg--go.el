
(use-package gotest)

(elpaca nil
  (require 'go-ts-mode)
  (require 'eglot)
  (require 'eldoc-box)
  (require 'electric)
  (require 'sideline)

  (defun tealeg--go-helper-f ()
    (eglot-ensure)
    (eldoc-box-hover-at-point-mode 1)
    (eletric-pair-mode 1)
    (sideline-mode 1)
    )

  (add-hook 'go-ts-mode-hook #'tealeg--go-helper-f))

(provide 'tealeg--go)

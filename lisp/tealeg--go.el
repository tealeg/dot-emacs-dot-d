
(use-package gotest)

(elpaca nil
  (require 'go-ts-mode)
  (require 'eglot)
  (require 'eldoc-box)
  (require 'electric)

  (defun tealeg--go-helper-f ()
    (eglot-ensure)
    (eletric-pair-mode 1)


    (unbind-key "C-?" go-ts-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point go-ts-mode-map)
    )

  (add-hook 'go-ts-mode-hook #'tealeg--go-helper-f))

(provide 'tealeg--go)

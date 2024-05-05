(use-package gotest
  :config
  (require 'go-ts-mode)
  (require 'eglot)
  (require 'eldoc-box)

  (defun tealeg--go-ts-helper-f ()
    (eglot-ensure)
    (unbind-key "C-?" go-ts-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point go-ts-mode-map))

  (add-hook 'go-ts-mode-hook #'tealeg--go-ts-helper-f))

(provide 'tealeg--go)

(use-package go-mode
  :config
  (require 'go-ts-mode)
  (require 'eglot)
  (require 'eldoc-box)

  (defun tealeg--go-ts-helper-f ()
    (eglot-ensure)
    (setq go-ts-mode-indent-offset 4)
    (unbind-key "C-?" go-ts-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point go-ts-mode-map)
    (add-hook 'before-save-hook 'eglot-format-buffer nil t))
  

  (add-hook 'go-ts-mode-hook #'tealeg--go-ts-helper-f)
  )


(use-package gotest :after go-mode)
(provide 'tealeg--go)

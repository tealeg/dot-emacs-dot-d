

(elpaca nil
  (require 'cc-mode)
  (require 'eglot)
  (require 'eldoc-box)

  (defun tealeg--c-mode-helper-f ()
    "Set up \"c-mode\"."
    (eglot-ensure)
    (unbind-key "C-?" c-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point c-mode-map)

    )

  (add-hook 'c-mode-hook #'tealeg--c-mode-helper-f))

(provide 'tealeg--c)

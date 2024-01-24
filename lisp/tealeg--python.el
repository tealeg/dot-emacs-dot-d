(elpaca nil
  (require 'python)
  (require 'eglot)
  (require 'eldoc-box)

  (defun tealeg--python-helper-f ()
    (eglot-ensure)
    (unbind-key "C-?" python-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point python-mode-map))
    

  (add-hook 'python-mode-hook #'tealeg--python-helper-f))

(provide 'tealeg--python)


(use-package rust-mode :ensure t)


(elpaca nil
  (require 'rust-mode)
  (require 'eldoc-box)


  (defun tealeg--rust-mode-helper-f ()
    (setq indent-tabs-mode nil
	  rust-format-on-save t)
    (prettify-symbols-mode 1)
    (eglot-ensure)
    (unbind-key "C-?" rust-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point rust-mode-map)
    )

  (add-hook 'rust-mode-hook #'tealeg--rust-mode-helper-f))

(provide 'tealeg--rust)

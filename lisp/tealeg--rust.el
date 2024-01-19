
(use-package rust-mode :ensure t)


(elpaca nil
  (require 'eldoc-box)


  (defun tealeg--rust-mode-helper-f ()
    (setq indent-tabs-mode nil
	  rust-format-on-save t)
    (prettify-symbols-mode 1)
    (eldoc-box-hover-at-point-mode 1))

  (add-hook 'rust-mode-hook #'tealeg--rust-mode-helper-f))

(provide 'tealeg--rust)


(straight-use-package 'go-mode)
(require 'go-mode)
(require 'lsp-mode)
(require 'dap-go)

(defun go-mode-setup ()
  (lsp-mode 1))
  

(add-hook 'go-mode-hook #'go-mode-setup)

(provide 'tealeg--go)

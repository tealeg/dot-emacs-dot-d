;;; tealeg-lsp.el -- configure Language Server Protocol
;;;
;;; Commentary:
;;;     We're a few years in, and with maturity comes simplicity, hopefully.
;;;
;;; Code:

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'lsp-treemacs)
(straight-use-package 'dap-mode)
(straight-use-package 'hydra)

(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
(lsp-treemacs-sync-mode 1)

(provide 'tealeg-lsp)
;;; tealeg-lsp.el ends here

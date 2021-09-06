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

(straight-use-package 'consult-lsp)

(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-ui-peek)
(define-key lsp-mode-map [remap xref-find-apropos] #'consult-lsp-symbols)
(add-hook 'lsp-ui-mode-hook (lambda ()
			      (lsp-ui-doc-enable)
			      (lsp-ui-peek-enable)))

(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
(lsp-treemacs-sync-mode 1)

(provide 'tealeg-lsp)
;;; tealeg-lsp.el ends here

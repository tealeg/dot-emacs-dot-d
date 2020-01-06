;;; tealeg-lsp.el -- setup language server protocol
;;;
;;; Commentary:
;;;	Language Server Protocol provides a common way of talking to a
;;;	backend about some programmning language.  This removes the
;;;	need, theoretically, to have to write support for every new
;;;	language into every editor.
;;;
;;; Code:

(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'company)
(straight-use-package 'company-lsp)
(require 'lsp-mode)
(require 'lsp-ui)
(require 'company)
(require 'company-lsp)
(push 'company-lsp company-backends)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-mode-hook 'company-mode)

(provide 'tealeg-lsp)
;;; tealeg-lsp.el ends here

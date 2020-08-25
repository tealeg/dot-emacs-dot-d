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
(straight-use-package 'flycheck)
(straight-use-package 'dap-mode)
(straight-use-package 'which-key)
(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-ui-imenu)
(require 'flycheck)
(require 'dap-mode)
(require 'which-key)


;; Enabling only some features
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(setq dap-print-io t)
(setq lsp-ui-sideline-ignore-duplicate t)

(defun lsp-mode-helper ()
  (lsp-ui-mode 1)
  (lsp-ui-doc-mode -1)
  (setq lsp-eldoc-render-all 1)
  (setq lsp-eldoc-enable-hover 1)
  (which-key-mode 1))

(add-hook 'lsp-mode-hook 'lsp-mode-helper)

(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(provide 'tealeg-lsp)
;;; tealeg-lsp.el ends here

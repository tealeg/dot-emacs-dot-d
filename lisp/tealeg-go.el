;;; tealeg-go.el -- Go configuration.
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'go-mode)
(straight-use-package 'go-test)
(require 'tealeg-lsp)
(require 'go-mode)
(require 'dap-go)
(require 'dap-ui)

(dap-go-setup)

(defun go-mode-helper-f ()
  "Setup go-mode."
  (require 'gotest)
  (setq go-test-verbose 1)
  )

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook #'go-mode-helper-f)





(provide 'tealeg-go)
;;; tealeg-go.el ends here.

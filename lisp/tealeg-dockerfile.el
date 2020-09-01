;;; tealeg-dockerfile.el -- configure dockerfile usage
;;;
;;; Commentary:
;;;
;;; Code:
(straight-use-package 'dockerfile-mode)

(require 'tealeg-lsp)
(require 'dockerfile-mode)

(add-hook 'dockerfile-mode-hook 'lsp-deferred)
;;; tealeg-dockerfile.el ends here

;;; tealeg-haskel.el -- customisations for haskell programming
;;;
;;; Commentary:
;;;    Blah blah, haskell
;;;
;;;
;;; Code:
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-haskell)
(straight-use-package 'haskell-mode)

(require 'lsp)
(require 'lsp-haskell)

(add-hook 'haskell-mode-hook #'lsp)
(setq lsp-haskell-process-path-hie "hie-wrapper")


(provide 'tealeg-haskell)
;;; tealeg-haskel.el ends here

(straight-use-package 'dockerfile-mode)

(require 'tealeg-lsp)
(require 'dockerfile-mode)

(add-hook 'dockerfile-mode-hook 'lsp-deferred)

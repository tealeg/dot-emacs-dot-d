
(straight-use-package 'go-mode)
(straight-use-package 'eglot)
(require 'go-mode)
(require 'eglot)


(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'tealeg--go)

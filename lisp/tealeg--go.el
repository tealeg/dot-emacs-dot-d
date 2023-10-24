
(require 'go-ts-mode)
(require 'eglot)
(use-package gotest)

(defun tealeg--go-helper-f ()
  (eglot-ensure)
  )

(add-hook 'go-ts-mode-hook #'tealeg--go-helper-f)


(provide 'tealeg--go)

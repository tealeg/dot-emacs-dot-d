
(require 'go-ts-mode)
(require 'eglot)

(defun tealeg--go-helper-f ()
  (eglot-ensure)
  )

(add-hook 'go-ts-mode-hook #'tealeg--go-helper-f)


(provide 'tealeg--go)

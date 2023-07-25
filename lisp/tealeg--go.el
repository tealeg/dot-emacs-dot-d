(use-package go-mode)
(use-package go-eldoc)
(use-package gotest)

(defun tealeg--go-mode-helper ()
  "Setup Go mode"
  (require 'gotest)
  (require 'go-eldoc)
  (go-eldoc-setup)
  )

  


(provide 'tealeg--go)

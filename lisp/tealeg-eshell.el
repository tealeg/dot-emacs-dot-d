;;; tealeg-eshell.el -- custom configuration for eshesll
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'exec-path-from-shell)
(require 'exec-path-from-shell)


(defun tealeg-eshell-mode-helper ()
  "Setup eshell environment."
  (exec-path-from-shell-initialize)
  )

(add-hook 'eshell-mode-hook 'tealeg-eshell-mode-helper)
(provide 'tealeg-eshell)
;;; tealeg-eshell.el ends here

;;; tealeg-eshell.el -- custom configuration for eshesll
;;;
;;; Commentary:
;;;
;;; Code:

;; (straight-use-package 'exec-path-from-shell)
;; (require 'exec-path-from-shell)


;; (defun tealeg-eshell-mode-helper ()
;;   "Setup eshell environment."
;;   ;; (exec-path-from-shell-initialize)
;;   )

;; (add-hook 'eshell-mode-hook 'tealeg-eshell-mode-helper)

(straight-use-package 'with-editor)

 (add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)


(add-to-list 'exec-path "/home/tealeg/go/bin")
(add-to-list 'exec-path "/home/tealeg/bin")

(defun eshell-helper-f ()
  "Setup eshell"

  (setq eshell-path-env (string-join exec-path ":"))
  (setenv "PAGER" "cat")
  )

(add-hook 'eshell-mode-hook 'eshell-helper-f)
(provide 'tealeg-eshell)
;;; tealeg-eshell.el ends here

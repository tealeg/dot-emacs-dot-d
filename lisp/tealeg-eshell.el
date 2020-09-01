;;; tealeg-eshell.el -- custom configuration for eshesll
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'with-editor)
(straight-use-package 'eshell-git-prompt)

(require 'eshell)

(add-hook 'shell-mode-hook  'with-editor-export-editor)
(add-hook 'term-exec-hook   'with-editor-export-editor)
(add-hook 'eshell-mode-hook 'with-editor-export-editor)


(add-to-list 'exec-path "/home/tealeg/go/bin")
(add-to-list 'exec-path "/home/tealeg/bin")


(defun eshell-helper-f ()
  "Setup eshell."
  (eshell-git-prompt-use-theme 'robbyrussell)
  (setq eshell-path-env (string-join exec-path ":" ))
  (setenv "PAGER" "cat")
  )

(add-hook 'eshell-mode-hook 'eshell-helper-f)

(provide 'tealeg-eshell)
;;; tealeg-eshell.el ends here

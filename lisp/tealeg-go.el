;;; tealeg-go.el -- Go configuration.
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'go-mode)
(straight-use-package 'go-test)
(require 'tealeg-lsp)
(require 'go-mode)
(require 'gotest)


(defun go-mode-helper-f ()
  "Setup go-mode."
  (require 'gotest)
  (setq go-test-verbose 1)
  (local-set-key (kbd "C-l t o") #'go-test-current-test)
  (local-set-key (kbd "C-l t f") #'go-test-current-file)
  (local-set-key (kbd "C-l t p") #'go-test-current-project)
  )

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook #'go-mode-helper-f)
(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'tealeg-go)
;;; tealeg-go.el ends here.

;;; tealeg--go -- Go setup for emacs
;;;
;;; Commentary:
;;;	Setup Go support
;;;
;;; Code:

(straight-use-package 'go-mode)
(straight-use-package 'go-test)
(straight-use-package 'flycheck)

(require 'go-mode)
(require 'gotest)
(require 'flycheck)

(require 'tealeg--edit)




(defun go-mode-helper-f ()
  "Setup go mode correctly."
  (require 'gotest)
  (setq go-test-verbose 1)
  (enable-tabs)
  (local-set-key (kbd "C-l t o") #'go-test-current-test)
  (local-set-key (kbd "C-l t f") #'go-test-current-file)
  (local-set-key (kbd "C-l t p") #'go-test-current-project)
  (local-set-key (kbd "M-.") #'lsp-ui-peek-find-definitions)

  )

(add-hook 'go-mode-hook #'lsp)
(add-hook 'go-mode-hook #'go-mode-helper-f)

(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'tealeg--go)
;;; tealeg--go.el ends here

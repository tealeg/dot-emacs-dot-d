(use-package flymake-markdownlint)
(use-package flymd)
;; (use-package langtool)
(require 'flyspell)

(use-package markdown-mode
  :config 

  (progn
    (defun tealeg--markdown-mode-helper-f ()
      (flyspell-mode 1)
      ;; (add-hook 'after-save-hook 'langtool-check nil 'make-it-local)
      )

    (add-to-list 'markdown-mode-hook #'tealeg--markdown-mode-helper-f)))

(provide 'tealeg--markdown)

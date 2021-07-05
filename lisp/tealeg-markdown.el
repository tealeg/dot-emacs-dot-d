;;(straight-use-package 'flymake-grammarly)
(straight-use-package 'flycheck-vale)
(flycheck-vale-setup)

;;(add-hook 'markdown-mode-hook 'flymake-grammarly-load)
;;(add-hook 'markdown-mode-hook 'flymake-mode)
(add-hook 'markdown-mode-hook 'flycheck-mode)

(provide 'tealeg-markdown)

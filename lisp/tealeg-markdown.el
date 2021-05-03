(straight-use-package 'flymake-grammarly)

(add-hook 'markdown-mode-hook 'flymake-grammarly-load)
(add-hook 'markdown-mode-hook 'flymake-mode)

(provide 'tealeg-markdown)

(use-package markdown-mode
  :config
  (setq sentence-end-double-space nil))

(use-package edit-indirect
  :after markdown-mode)


(provide 'tealeg--markdown)

(use-package tree-sitter-langs :ensure t)
(use-package tree-sitter :ensure t
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode 1)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


(provide 'tealeg--tree-sitter)

;; (use-package tree-sitter-langs :ensure t)
;; (use-package tree-sitter :ensure t
;;   :config
;;   (require 'tree-sitter-langs)
;;   (tree-sitter-langs-install-grammars t)
;;   (global-tree-sitter-mode 1)
;;   (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(provide 'tealeg--tree-sitter)

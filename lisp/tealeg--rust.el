
(use-package rust-mode)

(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil
			   rust-format-on-save t)
	    (prettify-symbols-mode 1)
	    ))

(use-package tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode 1)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))


(provide 'tealeg--rust)

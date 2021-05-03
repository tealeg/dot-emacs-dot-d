;;; tealeg-tree-sitter.el -- configuration for tree-sitter parsing
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)

;; Load the framework and the language bundle:

(require 'tree-sitter)
(require 'tree-sitter-langs)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'tealeg-tree-sitter)
;;; tealeg-tree-sitter.el ends here

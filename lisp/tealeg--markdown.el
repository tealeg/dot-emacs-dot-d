(use-package markdown-mode
  :config
  (setq sentence-end-double-space nil)
  
  (defun markdown-ts-setup ()
    "Setup treesit for markdown-ts-mode."
    (visual-line-mode 1)
    (treesit-major-mode-setup))
  
  (define-derived-mode markdown-ts-mode markdown-mode "Markdown[ts]"
    "Major mode for editing Markdown with tree-sitter."
    :syntax-table markdown-mode-syntax-table
    
    (setq-local font-lock-defaults nil)
    (when (treesit-ready-p 'markdown)
      (treesit-parser-create 'markdown)
      (markdown-ts-setup))))
  
(provide 'tealeg--markdown)

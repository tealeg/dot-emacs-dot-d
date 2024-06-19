(use-package markdown-mode
  :config
  (setq sentence-end-double-space nil)

  ;; (setq-local treesit-font-lock-feature-list
  ;;             '((comment)
  ;;               (constant tag attribute)
  ;;               (declaration)
  ;;               (delimiter)))

  ;; (treesit-font-lock-rules
  ;;  :language 'markdown
  ;;  :override t
  ;;  :feature 'delimiter
  ;;  '([ "<" ">" "/>" "</"] @font-lock-bracket-face)

  ;;  :language 'html
  ;;  :override t
  ;;  :feature 'comment
  ;;  '((comment) @font-lock-comment-face)

  ;;  ... )
  
  (defun markdown-ts-setup ()
    "Setup treesit for markdown-ts-mode."
    ;; Our tree-sitter setup goes here.

    ;; This handles font locking -- more on that below.
    ;; (setq-local treesit-font-lock-settings
    ;;             (apply #'treesit-font-lock-rules
    ;;                    markdown-ts-font-lock-rules))
    )

  ;; This handles indentation -- again, more on that below.
  ;; (setq-local treesit-simple-indent-rules markdown-ts-indent-rules)

  ;; ... everything else we talk about go here also ...

  ;; End with this
  (treesit-major-mode-setup))
  
  (define-derived-mode markdown-ts-mode markdown-mode "Markdown[ts]"
    "Major mode for editing Markdown with tree-sitter."
    :syntax-table markdown-mode-syntax-table
    
    (setq-local font-lock-defaults nil)
    (when (treesit-ready-p 'markdown)
      (treesit-parser-create 'markdown)
      (markdown-ts-setup)))
  
  ;; (use-package edit-indirect
  ;;   :after markdown-mode)
  

(provide 'tealeg--markdown)

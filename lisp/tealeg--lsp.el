(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'lsp-treemacs)
(straight-use-package 'treemacs)
(straight-use-package 'which-key)

(require 'lsp)
(require 'lsp-ui)
(require 'lsp-ui-peek)
(require 'lsp-ui-sideline)
(require 'lsp-modeline)
(require 'lsp-headerline)
(require 'lsp-treemacs)

(lsp-ui-peek-enable t)

(setq lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-show-hover t
      lsp-ui-sideline-show-code-actions t
      lsp-ui-peek-show-directory t
      read-process-output-max 4000
      )

(defun lsp-ui-mode-helper-f ()
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))


(add-hook 'lsp-ui-mode-hook #'lsp-ui-mode-helper-f)

(provide 'tealeg--lsp)

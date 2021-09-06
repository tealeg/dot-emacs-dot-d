(straight-use-package 'orderless)

(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides '((file (styles . (partial-completion)))))

(provide 'tealeg-orderless)

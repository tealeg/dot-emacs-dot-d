(require 'yaml-ts-mode)

(use-package highlight-indentation
  :hook yaml-ts-mode
  )

(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-ts-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-ts-mode))




(provide 'tealeg--yaml)

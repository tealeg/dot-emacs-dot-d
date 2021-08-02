(straight-use-package 'yaml-mode)
(straight-use-package 'flycheck-yamllint)

(add-hook 'yaml-mode-hook #'flycheck-yamllint-setup)

(provide 'tealeg-yaml)

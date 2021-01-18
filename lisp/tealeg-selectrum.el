(straight-use-package 'selectrum)
(straight-use-package 'selectrum-prescient)
;; (straight-use-package 'marginalia)

(defun selectrum-mode-helper-f ()
  "Set up selectrum mode,"
  (selectrum-prescient-mode +1)
  )

(add-hook 'selectrum-mode-hook 'selectrum-mode-helper-f)

(selectrum-mode +1)

(provide 'tealeg-selectrum)

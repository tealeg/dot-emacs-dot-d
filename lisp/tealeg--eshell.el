(use-package virtualenvwrapper)
(use-package exec-path-from-shell)

(require 'eshell)



(defun on-eshell-mode ()

  (exec-path-from-shell-initialize)
  (eshell/addpath "/Users/geoffrey/Library/Python/3.9/bin")
  )
  

(add-hook 'eshell-mode-hook #'on-eshell-mode)

(provide 'tealeg--eshell)

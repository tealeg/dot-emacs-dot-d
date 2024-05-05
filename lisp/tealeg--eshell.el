(use-package eshell-git-prompt
  :init
  (eshell-git-prompt-use-theme 'powerline)

  (defun tealeg--eshell-helper-f ()
    (setenv "TERM" "eterm"))

  (add-hook 'eshell-mode-hook 'tealeg--eshell-helper-f))

(provide 'tealeg--eshell)

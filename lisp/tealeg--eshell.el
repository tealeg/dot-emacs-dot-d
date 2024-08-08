(use-package eshell-git-prompt
  :init
  (eshell-git-prompt-use-theme 'git-radar)

  (defun tealeg--eshell-helper-f ()
    (setenv "TERM" "eterm")
    (defalias 'docker 'podman)
)

  (add-hook 'eshell-mode-hook 'tealeg--eshell-helper-f))

(provide 'tealeg--eshell)

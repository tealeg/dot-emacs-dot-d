(use-package eshell-git-prompt
  :init
  (eshell-git-prompt-use-theme 'git-radar)

  (defun tealeg--eshell-helper-f ()
    (setenv "TERM" "eterm")
    (setenv "NVM_DIR" (format "%s%s" (getenv "HOME")  "/.nvm"))

    (eshell/addpath (string-join (list
                                  (getenv "HOME")
                                  ".nvm"
                                  "versions"
                                  "node"
                                  "v22.9.0" "bin")
                                 "/"))

    
    (defalias 'docker 'podman)
)

  (add-hook 'eshell-mode-hook 'tealeg--eshell-helper-f))

(provide 'tealeg--eshell)

(use-package virtualenvwrapper)
(use-package exec-path-from-shell)

(require 'eshell)



(defun on-eshell-mode ()

  (exec-path-from-shell-initialize)
  (eshell/addpath "/Users/geoffrey/Library/Python/3.9/bin")

  (venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place

  (setq eshell-prompt-function (lambda () (concat venv-current-name " $ "))))
  

(add-hook 'eshell-mode-hook #'on-eshell-mode)

(provide 'tealeg--eshell)

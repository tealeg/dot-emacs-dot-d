(require 'eshell)
(require 'em-smart)
(use-package eshell-prompt-extras
  :config
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
	eshell-prompt-function 'epe-theme-lambda))
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(defun eshell/git (&rest args)
  (apply 'eshell-exec-visual (cons "git" args)))

(provide 'tealeg--eshell)

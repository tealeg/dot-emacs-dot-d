;;; tealeg-python -- setup python
;;;
;;; Commentary:
;;;    Once upon a time I had a huge Python config.  Now I barely use Python.
;;;
;;; Code:
(straight-use-package 'python-mode)
(straight-use-package 'projectile)
(require 'tealeg-lsp)
(require 'python-mode)
(require 'projectile)
(require 'flyspell)

(lsp-stdio-connection
   (lambda ()
     ;; implementation of the function that returns the proper
     ;; pyls for the current directory/project/file.
     "/usr/local/bin/pyls"
     ))

(defun tealeg-python-mode-helper ()
  "Setup 'python-mode'."
  (flyspell-prog-mode)
  (lsp-mode 1)
 )

(add-hook 'python-mode-hook 'tealeg-python-mode-helper)

(setq python-shell-interpreter "python3")
(provide 'tealeg-python)
;;; tealeg-python.el ends here


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
  (flyspell-prog-mode 1)
  (lsp-mode 1)
 )

(add-hook 'python-mode-hook 'tealeg-python-mode-helper)

(setq python-shell-interpreter "python3")
(provide 'tealeg-python)

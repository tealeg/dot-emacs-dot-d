
(require 'python)
(require 'eglot)

(defun tealeg--python-helper-f ()
  (eglot))

(add-hook 'python-mode-hook #'tealeg--python-helper-f)

(provide 'tealeg--python)

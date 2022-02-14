(require 'make-mode)
(require 'tealeg--edit)

(defun make-mode-helper-f ()
  (enable-tabs))

(add-hook 'makefile-mode-hook #'make-mode-helper-f)

(provide 'tealeg--make)

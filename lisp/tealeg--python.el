(require 'eldoc)
(require 'python)
(require 'whitespace)

(setq-default
   whitespace-line-column 80
   whitespace-style '(face lines-tail))


(defun tealeg--python-helper-f ()
  (message "tealeg--python-helper-f")
  (eldoc-mode 1)
  (setq display-fill-column-indicator-column 80)
  (display-fill-column-indicator-mode 1)
  (whitespace-mode 1)
  )

(add-hook 'python-mode-hook #'tealeg--python-helper-f)

(provide 'tealeg--python)

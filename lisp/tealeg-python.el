;;; tealeg-python --- Python setup
;;;
;;; Commentary:
;;;			Python setup

;;;; Code:

(require 'column-enforce-mode)
(require 'python)
(require 'flycheck)

(require 'flycheck-pyflakes)

(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)


(defun python-helper ()
	"Setup parameters and minor-modes for python coding."
	(setq python-fill-docstring-style 'pep-257-nn)
	(flycheck-mode 1)
	(column-enforce-mode 1))

(add-hook 'python-mode-hook 'python-helper)

(provide 'tealeg-python)
;;; tealeg-python.el ends here

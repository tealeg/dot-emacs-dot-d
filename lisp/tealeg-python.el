;;; tealeg-python --- Python setup
;;;
;;; Commentary:
;;;			Python setup

;;;; Code:

(require 'column-enforce-mode)
(require 'python)
;; (require 'hideshow)
(require 'yafolding)
(require 'flycheck)

(require 'flycheck-pyflakes)

(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)


(defun python-helper ()
	"Setup parameters and minor-modes for python coding."
	(setq python-fill-docstring-style 'pep-257-nn)
	;; (hs-minor-mode 1)
	(flycheck-mode 1)
	(yafolding-mode 1)
	(column-enforce-mode 1))

(add-hook 'python-mode-hook 'python-helper)

(provide 'tealeg-python)
;;; tealeg-python.el ends here

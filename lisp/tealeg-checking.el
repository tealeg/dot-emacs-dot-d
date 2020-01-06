;;; tealeg-checking.el -- automatic linting
;;;
;;; Commentary:
;;;	Global configuration of automatic linting
;;;
;;; Code:
(straight-use-package 'flycheck)
(require 'flycheck)

(global-flycheck-mode 1)

(provide 'tealeg-checking)
;;; tealeg-checking.el ends here

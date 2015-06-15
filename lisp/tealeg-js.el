;;; tealeg-js --- my js settings.
;;;
;;; Commentary:
;;;     Js setup

;;; Code:
(require 'smartparens)

(defun js-helpers ()
  "Setup 'js-mode'."
  (setq show-trailing-whitespace t)
	(smartparens-mode 1)
	(show-smartparens-mode t)
  (set-fill-column 79)
  (visual-line-mode 1))

(add-hook 'js-mode-hook 'js-helpers)

(provide 'tealeg-js)
;;; tealeg-js.el ends here

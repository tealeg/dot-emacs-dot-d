;;; tealeg-check --- my check settings.
;;;
;;; Commentary:
;;;     Check setup

;;; Code:

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'tealeg-check)
;;; tealeg-check.el ends here

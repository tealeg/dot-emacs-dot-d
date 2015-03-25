;;; tealeg-shell --- my shell settings.
;;;
;;; Commentary:
;;;     Shell setup

;;; Code:
(require 'eshell)
(setq eshell-buffer-shorthand t)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)


(require 'em-tramp)
(setq password-cache t)
(setq password-cache-expiry 60)

(provide 'tealeg-shell)
;;; tealeg-shell.el ends here

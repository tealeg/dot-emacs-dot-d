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

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-filter-apply)

(require 'compile)
(defun tealeg-strip-ansi-colors (arglist)
  "Strip ANSI color codes  output for PROC in STRING."
  (list (car arglist) (ansi-color-apply (cadr arglist))))

(add-function :filter-args (symbol-function 'compilation-filter) #'tealeg-strip-ansi-colors)
(provide 'tealeg-shell)
;;; tealeg-shell.el ends here

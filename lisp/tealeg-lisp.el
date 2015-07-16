;;; tealeg-lisp --- setup for Common Lisp programming
;;;
;;; Commentary:
;;;        Some essential CL setup, including SLIME
;;;
;;; Code:

(require 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")

(load "/home/tealeg/stumpwm-contrib/util/swm-emacs/stumpwm-mode.el")
;;(load "/home/tealeg/stumpwm-contrib/util/swm-emacs/stumpwm-utils.el")

(setq-default stumpwm-shell-program "/home/tealeg/stumpwm-contrib/util/stumpish/stumpish")

(provide 'tealeg-lisp)
;;; tealeg-lisp.el ends here

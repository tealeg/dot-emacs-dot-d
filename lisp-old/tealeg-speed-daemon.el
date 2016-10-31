;;; tealeg-speed-daemon -- tricks to speed up emacs ;-)
;;
;;; Commentary:

;;    Any random hacks that make things faster live here.

;;; Code:

(require 'jit-lock)

;; Allow emacs to consume more memory as cons cells before invoking GC.  Net
;; effect, fewer GC runs.
(setq gc-cons-threshold 200000000)

;; Finish redraws before processing input queue. The interupt to redisplay
;; exists because on older slower machines input can be laggy without it. On my
;; i7-3770k and i7-5600u CPUS this isn't so much or an issue ;-)
;;
;; Note that as of Emacs 24.5 this is no longer required.
;;(setq redisplay-dont-pause t)

;; (setq font-lock-support-mode 'jit-lock-mode)
;; (setq jit-lock-stealth-time 16
;;       jit-lock-defer-contextually t
;;       jit-lock-stealth-nice 0.5)
;; (setq-default font-lock-multiline t)

(provide 'tealeg-speed-daemon)
;;; tealeg-speed-daemon.el ends here

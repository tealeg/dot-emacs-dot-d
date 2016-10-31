;;; tealeg-speed-daemon -- tricks to speed up emacs ;-)
;;
;;; Commentary:

;;    Any random hacks that make things faster live here.

;;; Code:

;; Allow emacs to consume more memory as cons cells before invoking GC.  Net
;; effect, fewer GC runs.
(setq gc-cons-threshold 200000000)

(provide 'tealeg-speed-daemon)
;;; tealeg-speed-daemon.el ends here

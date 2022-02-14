;;; tealeg--kubernetes --- monitor k8s from Emacs
;;;
;;; Commentary:
;;;     Monitor k8s from Emacs.
;;;
;;; Code:

(straight-use-package 'kubernetes)

(require 'kubernetes)

(setq kubernetes-poll-frequency 3600
      kubernetes-redraw-frequency 3600)

(provide 'tealeg--kubernetes)
;;; tealeg--kubernetes.el ends here.

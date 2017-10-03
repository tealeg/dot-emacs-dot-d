;;; tealeg-frame --- my frame settings.
;;;
;;; Commentary:
;;;     Frame setup

;;; Code:
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode -1)
(horizontal-scroll-bar-mode -1)
(tool-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(winner-mode 1)
(display-battery-mode 1)
(put 'suspend-frame 'disabled t)
(setq-default indent-tabs-mode nil)

(provide 'tealeg-frame)
;;; tealeg-frame.el ends here

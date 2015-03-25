;;; tealeg-frame --- my frame settings.
;;;
;;; Commentary:
;;;     Frame setup

;;; Code:
(when (display-graphic-p)
	(menu-bar-mode -1)
	(scroll-bar-mode -1)
	(horizontal-scroll-bar-mode -1)
	(tool-bar-mode -1))
(line-number-mode 1)
(column-number-mode 1)
(put 'suspend-frame 'disabled t)

(provide 'tealeg-frame)
;;; tealeg-frame.el ends here

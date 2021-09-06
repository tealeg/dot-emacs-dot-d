;;; tealeg-appearance.el -- Configuration visual aspects of emacs
;;;
;;; Commentary:
;;;	Configuration for theming, chrome aspects, fonts etc..
;;;
;;; Code:

(setq-default line-spacing 7)
(set-frame-font "IBM Plex Mono-17")

(straight-use-package 'doom-themes)
(straight-use-package 'hlinum)
(straight-use-package 'doom-modeline)
(load-theme 'doom-flat-white t)
(tooltip-mode 0)
(scroll-bar-mode 0)
(window-divider-mode 0)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'doom-modeline)
(setq-default doom-modeline-height 40
	      doom-modeline-bar-width 12
	      doom-modeline-buffer-file-name-style 'truncate-upto-project
	      doom-modeline-minor-modes t
	      )
(display-time)



(provide 'tealeg-appearance)
;;; tealeg-appearance.el ends here.

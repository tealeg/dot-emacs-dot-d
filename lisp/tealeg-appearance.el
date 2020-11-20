;;; tealeg-appearance.el -- how emacs looks
;;;
;;; Commentary:
;;;	Configuration for theming, chrome aspects, fonts etc..
;;;
;;; Code:

(straight-use-package 'doom-themes)
(straight-use-package 'doom-modeline)
(straight-use-package 'all-the-icons)
(straight-use-package 'green-screen-theme)
(straight-use-package 'poet-theme)
(straight-use-package 'tron-legacy-theme)
(straight-use-package 'eink-theme)
(straight-use-package 'borland-blue-theme)

(require 'time)


(setq-default font-use-system-font nil)
(when (display-graphic-p)
  (if (eq system-type 'darwin)
      (progn
	(set-frame-font "IBM Plex Mono-14")
	(set-face-font 'default "IBM Plex Mono-14")
	(set-face-font 'variable-pitch "IBM Plex Mono-14")
	(set-face-font 'fixed-pitch "IBM Plex Mono-14")
	(set-face-font 'fixed-pitch-serif "IBM Plex Mono-14")
	(setq-default line-spacing 0.3))
    (progn
      (set-frame-font "Monospac821 BT-8")
      (set-face-font 'default "Monospac821 BT-8")
      (set-face-font 'variable-pitch "Humnst777 BT-8")
      (set-face-font 'fixed-pitch "Monospac821 BT-8")
      (set-face-font 'fixed-pitch-serif "Monospac821 BT-8")
      )
    )
  (load-theme 'doom-henna)
  )



;; If the icons aren't showing, this should fix that ;-)
;; (all-the-icons-install-fonts t)

(doom-modeline-mode 1)
(display-battery-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)
(global-linum-mode -1)
(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(display-time-mode 1)
(setq display-time-day-and-date t)
(setq display-time-format " [%Y/%m/%d %H:%M] ")
(setq display-time-load-average-threshold 4.0)
(if (boundp 'fringe-mode)
    (fringe-mode 8))


(provide 'tealeg-appearance)
;;; tealeg-appearance.el ends here

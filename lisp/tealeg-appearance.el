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

(require 'time)
(require 'doom-themes)
(require 'poet-theme)
(require 'doom-modeline)
(require 'all-the-icons)

(setq font-use-system-font nil)
(when (display-graphic-p)
  (load-theme 'doom-henna)
  (set-frame-font "Monospac821 BT-8")
  (set-face-font 'default "Monospac821 BT-8")
  (set-face-font 'variable-pitch "Humnst777 BT-8")
  (set-face-font 'fixed-pitch "Monospac821 BT-8")
  (set-face-font 'fixed-pitch-serif "Monospac821 BT-8")
  
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

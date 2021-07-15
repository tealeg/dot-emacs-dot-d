;;; tealeg-appearance.el -- Configuration visual aspects of emacs
;;;
;;; Commentary:
;;;	Configuration for theming, chrome aspects, fonts etc..
;;;
;;; Code:


(straight-use-package 'modus-themes)

(load-theme 'modus-vivendi t)
(add-to-list 'default-frame-alist
             '(font . "IBM Plex Mono-14"))
(set-frame-font "IBM Plex Mono-14")

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "IBM Plex Serif" ))))
 '(fixed-pitch ((t ( :family "IBM Plex Mono" )))))

  (set-frame-parameter nil 'internal-border-width 12)
;  (set-frame-parameter nil 'width 81)
;  (set-frame-parameter nil 'height 45)
  (set-frame-parameter nil 'left-fringe 24)
  (set-frame-parameter nil 'right-fringe 24)
  (if (fboundp 'tool-bar-mode) (tool-bar-mode nil))
  (tooltip-mode 0)
  (scroll-bar-mode 0)
  (menu-bar-mode 0)
;;  (setq window-divider-default-right-width 24)
;;  (setq window-divider-default-places 'right-only)
;;  (window-divider-mode 0)


(provide 'tealeg-appearance)
;;; tealeg-appearance.el ends here.

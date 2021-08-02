;;; tealeg-appearance.el -- Configuration visual aspects of emacs
;;;
;;; Commentary:
;;;	Configuration for theming, chrome aspects, fonts etc..
;;;
;;; Code:

(add-to-list 'default-frame-alist
             '(font . "IBM Plex Mono-15"))
(setq-default line-spacing 7)
(set-frame-font "IBM Plex Mono-15")
(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "IBM Plex Sans" ))))
 '(fixed-pitch ((t ( :family "IBM Plex Mono" )))))


;;(straight-use-package 'modus-themes)
;; (straight-use-package 'organic-green-theme)
(straight-use-package 'spacegray-theme)
(straight-use-package 'hlinum)

;;(setq modus-themes-variable-pitch-headings t)
;; (setq modus-themes-variable-pitch-ui t)
;;(load-theme 'modus-operandi t)
;; (load-theme 'organic-green t)
(load-theme 'spacegray t)
(global-hl-line-mode 1)
(global-linum-mode 1)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))
(require 'hlinum)
(hlinum-activate)
(fringe-mode -1)
;;  (set-frame-parameter nil 'internal-border-width 12)
;  (set-frame-parameter nil 'width 81)
;  (set-frame-parameter nil 'height 45)
  ;; (set-frame-parameter nil 'left-fringe 24)
  ;; (set-frame-parameter nil 'right-fringe 24)
(if (fboundp 'tool-bar-mode) (tool-bar-mode nil))
(tooltip-mode 0)
(scroll-bar-mode 0)
(window-divider-mode 0)


(provide 'tealeg-appearance)
;;; tealeg-appearance.el ends here.

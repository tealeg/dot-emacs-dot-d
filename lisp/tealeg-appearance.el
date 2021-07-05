;;; tealeg-appearance.el -- Configuration visual aspects of emacs
;;;
;;; Commentary:
;;;	Configuration for theming, chrome aspects, fonts etc..
;;;
;;; Code:
(straight-use-package '(nano-theme :type git :host github
                                   :repo "rougier/nano-theme"))

;;(message standard-display-table)
(require 'nano-theme)
(nano-light)

  ;; (set-frame-parameter nil 'internal-border-width 24)
  ;; (set-frame-parameter nil 'width 81)
  ;; (set-frame-parameter nil 'height 45)
  ;; (set-frame-parameter nil 'left-fringe 0)
  ;; (set-frame-parameter nil 'right-fringe 0)
  ;; (if (fboundp 'tool-bar-mode) (tool-bar-mode nil))
  ;; (tooltip-mode 0)
  ;; (scroll-bar-mode 0)
  ;; (menu-bar-mode 0)
  ;; (setq window-divider-default-right-width 24)
  ;; (setq window-divider-default-places 'right-only)
  ;; (window-divider-mode 1)


(provide 'tealeg-appearance)
;;; tealeg-appearance.el ends here.

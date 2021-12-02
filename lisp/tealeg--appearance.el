;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code: 

;; (straight-use-package 'doom-themes)
;; (straight-use-package 'doom-modeline)
(straight-use-package 'pretty-mode-plus)
(straight-use-package 'monochrome-theme)
(straight-use-package 'eink-theme)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
;; (doom-modeline-mode -1)
(custom-set-default 'mode-line-compact t)
(cond
 ((string-equal system-type "darwin")
    (progn
      (message "Loading Mac OS X apperance parameters")
      (load-theme 'monochrome-bright t)
      (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-14"))
      (set-frame-font "IBM Plex Mono-14")
      (set-face-font 'variable-pitch "IBM Plex Sans-14")
      (set-face-font 'mode-line "IBM Plex Serif-12")
      (set-face-font 'mode-line-inactive "IBM Plex Serif-12")
      (set-face-attribute 'fringe nil :background "#ffffff")
      (set-face-attribute 'mode-line nil :box (list :line-width 5 :color "white" :style nil ) :overline "black" :underline nil :background "white")
      (set-face-attribute 'mode-line-inactive nil :box (list :line-width 5 :color "white" :style nil ) :overline "black" :underline nil :background "white" :foreground "gray50")
      (set-fringe-style '( 40 . 40 ))

      ))
 ((string-equal system-type "gnu/linux")
  (progn
    (message "Loading Linux appearance parameters")
    (load-theme 'monochrome-bright t)
    (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-12"))
    (set-frame-font "IBM Plex Mono-12")
    (set-face-font 'mode-line "IBM Plex Serif-10")
    (set-face-font 'mode-line-inactive "IBM Plex Serif-10")
    (menu-bar-mode -1)
      (set-face-attribute 'fringe nil :background "#ffffff")
      (set-face-attribute 'mode-line nil :box (list :line-width 3 :color "white" :style nil ) :overline "black" :underline nil :background "white")
      (set-face-attribute 'mode-line-inactive nil :box (list :line-width 3 :color "white" :style nil ) :overline "black" :underline nil :background "white" :foreground "gray50")
      (set-fringe-style '( 20 . 20 ))
    ;; (when (display-graphic-p)
    ;;   (load-theme 'doom-solarized-dark-high-contrast t))
    )))



(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)
(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

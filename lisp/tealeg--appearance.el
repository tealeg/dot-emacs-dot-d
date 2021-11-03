;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code: 

(straight-use-package 'doom-themes)
(straight-use-package 'doom-modeline)
(straight-use-package 'pretty-mode-plus)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(doom-modeline-mode 1)

(cond
 ((string-equal system-type "darwin")
    (progn
      (message "Loading Mac OS X apperance parameters")
      (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-17"))
      (set-frame-font "IBM Plex Mono-17")
      (set-face-font 'variable-pitch "IBM Plex Sans-17")
      (set-face-font 'mode-line "IBM Plex Mono-14")
      (load-theme 'doom-solarized-dark-high-contrast t)
      ))
 ((string-equal system-type "gnu/linux")
  (progn
    (message "Loading Linux appearance parameters")
    (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-12"))
    (set-frame-font "IBM Plex Mono-12")
    (set-face-font 'mode-line "IBM Plex Mono-10")
    (menu-bar-mode -1)
    (when (display-graphic-p)
      (load-theme 'doom-solarized-dark-high-contrast t))
    )))



(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)
(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

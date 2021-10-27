;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code: 

;;(straight-use-package 'lavenderless-theme)
;;(straight-use-package 'green-is-the-new-black-theme)

(straight-use-package 'modus-themes)
(straight-use-package 'base16-theme)
(straight-use-package 'nano-modeline)


(require 'nano-modeline)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(nano-modeline-mode 1)

(cond
 ((string-equal system-type "darwin")
    (progn
      (message "Loading Mac OS X apperance parameters")
      (load-theme 'modus-vivendi t)
      (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-17"))
      (set-frame-font "IBM Plex Mono-17")
      (set-face-font 'variable-pitch "IBM Plex Sans-17")
      ))
 ((string-equal system-type "gnu/linux")
  (progn
    (message "Loading Linux appearance parameters")
    (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-12"))
    (set-frame-font "IBM Plex Mono-12")
    (menu-bar-mode -1)
    (when (display-graphic-p)
	(load-theme 'base16-darkmoss t))
    )))


(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

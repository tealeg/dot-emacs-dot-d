;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code: 

(straight-use-package 'lavenderless-theme)
(straight-use-package 'green-is-the-new-black-theme)
;;(straight-use-package 'nano-modeline)

(require 'nano-modeline)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(nano-modeline-mode 1)

;; (load-theme 'green-is-the-new-black t)
(load-theme 'lavenderless t)

(cond
 ((string-equal system-type "darwin")
    (progn
      (message "Loading Mac OS X apperance parameters")
      (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-14"))
      (set-frame-font "IBM Plex Mono-14")
      ))
 ((string-equal system-type "gnu/linux")
  (progn
    (message "Loading Linux appearance parameters")
    (add-to-list 'default-frame-alist '(font . "IBM Plex Mono-12"))
    (set-frame-font "IBM Plex Mono-12")
    (menu-bar-mode -1))))




(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

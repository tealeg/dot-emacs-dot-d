;;; tealeg--appearance -- frame configuration  -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code:

(setq lexical-binding t)

(straight-use-package 'pretty-mode)
(straight-use-package 'solarized-emacs)
(straight-use-package 'doom-themes)
(straight-use-package 'weyland-yutani-theme)
(straight-use-package 'hydandata-light-theme)
;; (straight-use-package 'telephone-line)
(require 'pretty-mode)
(require 'diff-mode)

(defun tealeg--linux-p ()
  "Return t when the current system is gnu/linux."
  (string-equal system-type "gnu/linux"))

(when (tealeg--linux-p) (menu-bar-mode -1))


(if (tealeg--linux-p)
    (set-frame-font "Victor Mono-11")
  (set-frame-font "Victor Mono-14"))
(straight-use-package 'pretty-mode-plus)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(fringe-mode 20)
(display-time-mode 1)
(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)

;; (load-theme 'hydandata-light-theme)
;; (load-theme 'weyland-yutani t)


(load-theme 'doom-one-light)


(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

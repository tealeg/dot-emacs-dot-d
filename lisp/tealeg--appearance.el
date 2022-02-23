;;; tealeg--appearance -- frame configuration  -*- lexical-binding: t; -*-
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code:

(setq lexical-binding t)

(straight-use-package 'pretty-mode)
(straight-use-package 'weyland-yutani-theme)
(straight-use-package 'hydandata-light-theme)
(straight-use-package 'telephone-line)
(require 'pretty-mode)


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

(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)

(setq telephone-line-primary-left-separator 'telephone-line-gradient
      telephone-line-secondary-left-separator 'telephone-line-nil
      telephone-line-primary-right-separator 'telephone-line-gradient
      telephone-line-secondary-right-separator 'telephone-line-nil)
(setq telephone-line-height 24
      telephone-line-evil-use-short-tag t)


(defun tealeg--apply-telephone-line-theme (orig &rest args)
  "Setup telephone line when loading themes"
  (let ((result (apply orig args)))
    (telephone-line-mode -1)
    (set-face-background 'telephone-line-accent-active (face-background 'diff-added))
    (set-face-foreground 'telephone-line-accent-active (face-foreground 'diff-added))
    (set-face-background 'telephone-line-accent-inactive (face-background 'font-lock-comment-face))
    (set-face-foreground 'telephone-line-accent-inactive (face-foreground 'font-lock-comment-face))
    (telephone-line-mode 1)
    result
    )

  )
(telephone-line-mode 1)

(advice-add 'load-theme :around #'tealeg--apply-telephone-line-theme)
(advice-add 'disable-theme :around #'tealeg--apply-telephone-line-theme)

;; (load-theme 'hydandata-light-theme)
(load-theme 'weyland-yutani t)


(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

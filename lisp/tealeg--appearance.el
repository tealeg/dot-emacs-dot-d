;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code:

(setq lexical-binding t)

(straight-use-package 'pretty-mode-plus)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)

(load-theme 'tealeg t)

(custom-set-default 'mode-line-compact t)

(defun tealeg--linux-p ()
  "Return t when the current system is gnu/linux."
  (string-equal system-type "gnu/linux"))

(defun tealeg--set-edit-buffer-font (font)
  (add-to-list 'default-frame-alist '(font . ,font))
  (set-frame-font font))

(defun tealeg--set-mode-line-font (font)
  (set-face-font 'mode-line font)
  (set-face-font 'mode-line-inactive font))

(defun tealeg--set-variable-pitch-font (font)
  (set-face-font 'variable-pitch font))


(defun tealeg--set-font (mono-font variable-font)
  "Set emacs fonts to provided MONO-FONT and VARIABLE-FONT, using preset sizes per OS."
  (apply (lambda (buffer-point-size minibuffer-point-size mono-font variable-font)
           (tealeg--set-edit-buffer-font (concat mono-font "-" (int-to-string buffer-point-size)))
           (tealeg--set-mode-line-font (concat variable-font "-" (int-to-string minibuffer-point-size)))
           (tealeg--set-variable-pitch-font (concat variable-font "-" (int-to-string buffer-point-size)))
           (setq line-spacing 0.2))
         (list
          (if (tealeg--linux-p) 13 14)
          (if (tealeg--linux-p) 13 14)
          mono-font
          variable-font)))



(tealeg--set-font "Victor Mono" "Victor Mono")
(when (tealeg--linux-p) (menu-bar-mode -1))


(require 'pretty-mode)
(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)
(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

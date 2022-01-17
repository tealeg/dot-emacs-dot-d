;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code: 

(straight-use-package 'pretty-mode-plus)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)

;;(load-theme 'tealeg t)

(custom-set-default 'mode-line-compact t)

(defun tealeg--linux-p ()
  "Return t when the current system is gnu/linux."
  (string-equal system-type "gnu/linux"))

(defun tealeg--set-font (mono-font variable-font)
  "Set emacs fonts to provided MONO-FONT and VARIABLE-FONT, using preset sizes per OS."
  (let* ((buffer-point-size (if (tealeg--linux-p) 13 15))
	 (minibuffer-point-size (if (tealeg--linux-p) 13 15))
	 (buffer-font (concat mono-font "-" (int-to-string buffer-point-size)))
	 (minibuffer-font (concat variable-font "-" (int-to-string minibuffer-point-size)))
	 (variable-pitch-font (concat variable-font "-" (int-to-string buffer-point-size)))
    )

    (add-to-list 'default-frame-alist '(font . buffer-font))
    (set-frame-font buffer-font)
    (set-face-font 'mode-line minibuffer-font)
    (set-face-font 'mode-line-inactive minibuffer-font)
    (set-face-font 'variable-pitch variable-pitch-font)))


;;(tealeg--set-font "IBM Plex Mono" "IBM Plex Sans")
;; (tealeg--set-font "Pixel Operator Mono 8" "Pixel Operator 8")
;; (tealeg--set-font "Source Code Pro" "Source Sans Pro")
;; (tealeg--set-font "TT2020 Style E" "TT2020 Style E")
(tealeg--set-font "DM Mono" "DM Mono")
(when (tealeg--linux-p) (menu-bar-mode -1))
(setq line-spacing 0.4)

(require 'pretty-mode)
(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)
(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

;;; tealeg--appearance -- frame configuration
;;;
;;; Commentary:
;;;	Make it puuuuurdy
;;;
;;; Code:



(setq lexical-binding t)

(straight-use-package
  '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))
(straight-use-package 'mini-frame)




(setq nano-font-family-monospaced "Victor Mono")
(setq nano-font-size 14)
(require 'nano-base-colors)
(require 'nano-faces)
(require 'nano-theme-light)
;; (require 'nano-theme-dark)
(require 'nano-theme)
(require 'nano-help)
(require 'nano-splash)
(require 'nano-layout)
(require 'nano-modeline)
(require 'nano-session)
(require 'nano-colors)
(setq nano-light-foreground nano-color-foreground)
(setq nano-light-background nano-color-background)
(setq nano-light-popout nano-color-popout)
(setq nano-light-subtle nano-color-subtle)
(setq nano-light-faded nano-color-faded)
(require 'nano-minibuffer)
(require 'nano-command)
(straight-use-package 'ts)
(require 'nano-agenda)
(nano-theme)


(straight-use-package 'pretty-mode-plus)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)

(defun tealeg--linux-p ()
  "Return t when the current system is gnu/linux."
  (string-equal system-type "gnu/linux"))

(when (tealeg--linux-p) (menu-bar-mode -1))


(require 'pretty-mode)
(defun prog-mode-helper-f ()
  "Setup up all prog-modes a little bit ;-)"
  (pretty-mode 1))

(add-hook 'prog-mode-hook #'prog-mode-helper-f)
(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here

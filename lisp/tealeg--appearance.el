(require 'custom)

(defun tealeg/on-theme-load () 
  (set-frame-font "IBM Plex Mono-14:Regular")
  (setq line-spacing 5)
  (fringe-mode (cons 15 15)))

(defun tealeg/on-theme-disable ()
  (tealeg/on-theme-load))

(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
    "Run `after-load-theme-hook'."
    (run-hooks 'after-load-theme-hook))

(defvar after-disable-theme-hook nil
  "Hook run after a color theme is disabled using `disable-theme'.")

(defadvice disable-theme (after run-after-disable-theme-hook activate)
    "Run `after-disable-theme-hook'."
    (run-hooks 'after-disable-theme-hook))


(add-hook 'after-load-theme-hook 'tealeg/on-theme-load)
(add-hook 'after-disable-theme-hook 'tealeg/on-theme-disable)

(window-divider-mode -1)
(column-number-mode 1)

(use-package laguna-theme)
(use-package liso-theme)
(use-package inverse-acme-theme)
(use-package acme-theme
  :config (load-theme 'acme t nil)
  )




(provide 'tealeg--appearance)

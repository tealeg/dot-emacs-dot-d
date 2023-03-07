(require 'straight)
(require 'ruler-mode)

(straight-use-package 'catppuccin-theme)
(straight-use-package 'modus-themes)
(straight-use-package 'sr-speedbar)

;; (load-theme 'catppuccin t)
(load-theme 'modus-operandi-tinted t)


(defun tealeg/on-theme-load () 
  (set-frame-font "IBM Plex Mono-14:Regular")
  (setq line-spacing 5)
  (set-face-foreground 'window-divider-last-pixel (face-foreground 'highlight))
  (set-face-background 'window-divider (face-background 'highlight))
  (set-face-foreground 'window-divider (face-background 'highlight))
  (set-face-foreground 'window-divider-first-pixel (face-foreground 'highlight))
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

(column-number-mode 1)

(add-hook 'fundamental-mode 'ruler-mode)
(require 'sr-speedbar)
(global-set-key (kbd "M-s M-s") 'sr-speedbar-toggle)

(provide 'tealeg--appearance)

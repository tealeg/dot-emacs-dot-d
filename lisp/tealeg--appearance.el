(use-package eldoc-box :ensure t)

(require 'disp-table)
(require 'custom)
(require 'org-faces)

;; (use-package smart-mode-line-powerline-theme)
;; (use-package smart-mode-line
;;   :config
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'respectful)
;;   (sml/setup)
;;   (smart-mode-line-enable))
;; (use-package mini-modeline
;;   :after smart-mode-line
;;   :config
;;   (mini-modeline-mode t))

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

(global-hl-line-mode 1)


(setq x-underline-at-descent-line t)
;; Vertical window divider
(setq window-divider-default-right-width 2)
(setq window-divider-default-places 'right-only)
(window-divider-mode -1)
;; No ugly button for checkboxes
(setq widget-image-enable nil)

;; Hide org markup for README
(setq org-hide-emphasis-markers t)

(defun tealeg/font-set-ibm-plex ()
    (set-frame-font "IBM Plex Mono-12:Medium")
    (set-face-font 'variable-pitch "IBM Plex Sans-12:Medium")
    (set-face-font 'font-lock-comment-face "IBM Plex Sans-12:Medium")
    (set-face-font 'font-lock-doc-face "IBM Plex Serif-12"))

(defun tealeg/font-set-input ()
    (set-frame-font "Input Mono-12:Medium")
    (set-face-font 'variable-pitch "Input Sans-12:Medium")
    (set-face-font 'font-lock-comment-face "Input Sans-12:Medium")
    (set-face-font 'font-lock-doc-face "Input Serif-12"))

(defun tealeg/font-set-firacode ()
    (set-frame-font "FiraCode Nerd Font Mono-12:Medium")
    (set-face-font 'variable-pitch "FiraCode Nerd Font Propo-12:Medium")
    (set-face-font 'font-lock-comment-face "FiraCode Nerd Font Propo-12:Medium")
    (set-face-font 'font-lock-doc-face "FiraCode Nerd Font Propo-12:Medium"))
  

(defun tealeg/on-theme-load ()
  ;; (tealeg/font-set-ibm-plex)
  ;; (tealeg/font-set-input)
  (tealeg/font-set-firacode)
  (set-face-italic 'font-lock-comment-face 1)
  (set-face-italic 'font-lock-doc-face 1)
  (setq line-spacing 7)
  (fringe-mode (cons 15 15))
  ;; Fall back font for glyph missing in Roboto
  (defface fallback '((t :family "FiraCode Nerd Font"
			 :inherit 'nano-face-faded)) "Fallback")
  (set-display-table-slot standard-display-table 'truncation
                          (make-glyph-code ?… 'fallback))
  (set-display-table-slot standard-display-table 'wrap
                         (make-glyph-code ?↩ 'fallback))
  )

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

(use-package ef-themes
  :config (load-theme 'ef-spring t))

(bind-key "M-RET" #'toggle-frame-maximized)

(provide 'tealeg--appearance)

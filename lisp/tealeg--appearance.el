(require 'disp-table)
(require 'custom)
(require 'org-faces)


(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)

(global-hl-line-mode 1)

;; (setq header-line-format mode-line-format)
;; (setq-default mode-line-format nil)

(setq x-underline-at-descent-line t)
;; Vertical window divider
(setq window-divider-default-right-width 2)
(setq window-divider-default-places 'right-only)
(window-divider-mode -1)
;; No ugly button for checkboxes
(setq widget-image-enable nil)

;; Hide org markup for README
(setq org-hide-emphasis-markers t)

(defun tealeg/on-theme-load ()
  (set-frame-font "IBM Plex Mono-16:Medium")
  (set-face-font 'variable-pitch "IBM Plex Sans-16:Medium")
  (set-face-font 'font-lock-comment-face "IBM Plex Serif-16")
  (set-face-italic 'font-lock-comment-face 1)
  (set-face-font 'font-lock-doc-face "IBM Plex Serif-16")
  (set-face-italic 'font-lock-doc-face 1)
  (setq line-spacing 5)
  (fringe-mode (cons 15 15))
  ;; Fall back font for glyph missing in Roboto
  (defface fallback '((t :family "Fira Code"
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

;; (window-divider-mode -1)
;; (column-number-mode 1)

;; (use-package laguna-theme
;;   :config (load-theme 'laguna t))
;; (use-package liso-theme)
;; (use-package inverse-acme-theme)

;; (use-package acme-theme)
(use-package ef-themes
  :config (load-theme 'ef-elea-dark t))


(provide 'tealeg--appearance)

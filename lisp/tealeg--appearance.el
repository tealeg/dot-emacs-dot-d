(require 'custom)
(require 'org-faces)

(defun tealeg/on-theme-load () 
  (set-frame-font "Input Mono-16")
  (set-face-font 'variable-pitch "Input Sans-16")
  (set-face-font 'variable-pitch-text "Input Serif-16")
  (set-face-font 'font-lock-doc-face "Input Serif-16")
  (set-face-italic 'font-lock-doc-face 1)
  (set-face-font 'font-lock-comment-face "Input Serif-16")
  (set-face-italic 'font-lock-comment-face 1)
  (set-face-font 'default "Input Mono-16")
  (set-face-font 'org-default "Input Serif-16")
  (set-face-font 'org-code "Input Mono-16")
  (set-face-font 'org-level-1 "Input Sans-40")
  (set-face-bold 'org-level-1 1)
  (set-face-font 'org-level-2 "Input Sans-32")
  (set-face-bold 'org-level-2 1)
  (set-face-font 'org-level-3 "Input Sans-28")
  (set-face-bold 'org-level-3 1)
  (set-face-font 'org-level-4 "Input Sans-24")
  (set-face-bold 'org-level-4 1)
  (set-face-font 'org-level-4 "Input Sans-22")
  (set-face-bold 'org-level-4 1)
  (set-face-font 'org-level-5 "Input Sans-20")
  (set-face-bold 'org-level-5 1)
  (set-face-font 'org-level-6 "Input Sans-18")
  (set-face-bold 'org-level-6 1)
  (set-face-font 'org-level-7 "Input Sans-16")
  (set-face-bold 'org-level-7 1)
  (set-face-font 'org-todo "Input Mono-10")
  (set-face-font 'org-quote "Input Serif-16")
  (set-face-italic 'org-quote 1)
  (set-face-foreground 'org-quote (face-foreground 'default))

  (set-face-attribute 'org-todo nil :inverse-video t :box '(:line-width 3 :style released-button))
  (set-face-font 'org-done "Input Mono-10")
  (set-face-attribute 'org-done nil :inverse-video t :box '(:line-width 3 :style released-button))
  
  (set-face-font 'org-priority "Input Mono-10")
  (set-face-attribute 'org-priority nil :inverse-video t :box '(:line-width 3 :style released-button))

  (set-face-font 'org-date "Input Sans-16")
  (set-face-attribute 'org-date nil :inverse-video t :box '(:line-width 3 :style released-button))
  ;; (set-face-font 'org-scheduled "Input Sans-10")
  ;; (set-face-font 'org-scheduled "Input Sans-10")
  
  
  (setq line-spacing 5)
  (fringe-mode (cons 15 15))
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

(window-divider-mode -1)
(column-number-mode 1)


;; (use-package minimal-theme
;;     :config (load-theme 'minimal-light t nil))

(load-theme 'wombat)

(provide 'tealeg--appearance)

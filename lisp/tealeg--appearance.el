;;; tealeg--appearance --- Look and feel of emacs
;;;
;;; Commentary:
;;;     Make it puuuurdy
;;;
;;; Code:

(require 'disp-table)

(setq default-frame-alist
      (append (list
	           '(min-height . 1)
               '(height     . 45)
	           '(min-width  . 1)
               '(width      . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 24)
               '(left-fringe    . 1)
               '(right-fringe   . 1)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))



(use-package modus-themes
  :config
  (require 'modus-themes)
  
  ;; In all of the following, WEIGHT is a symbol such as `semibold',
  ;; `light', `bold', or anything mentioned in `modus-themes-weights'.
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui nil
        modus-themes-custom-auto-reload t
        modus-themes-disable-other-themes t

        ;; Options for `modus-themes-prompts' are either nil (the
        ;; default), or a list of properties that may include any of those
        ;; symbols: `italic', `WEIGHT'
        modus-themes-prompts '(italic bold)

        ;; The `modus-themes-completions' is an alist that reads two
        ;; keys: `matches', `selection'.  Each accepts a nil value (or
        ;; empty list) or a list of properties that can include any of
        ;; the following (for WEIGHT read further below):
        ;;
        ;; `matches'   :: `underline', `italic', `WEIGHT'
        ;; `selection' :: `underline', `italic', `WEIGHT'
        modus-themes-completions
        '((matches . (extrabold))
          (selection . (semibold italic text-also)))

        modus-themes-org-blocks 'gray-background ; {nil,'gray-background,'tinted-background}

        ;; The `modus-themes-headings' is an alist: read the manual's
        ;; node about it or its doc string.  Basically, it supports
        ;; per-level configurations for the optional use of
        ;; `variable-pitch' typography, a height value as a multiple of
        ;; the base font size (e.g. 1.5), and a `WEIGHT'.
        modus-themes-headings
        '((1 . (variable-pitch 1.5))
          (2 . (1.3))
          (agenda-date . (1.3))
          (agenda-structure . (variable-pitch light 1.8))
          (t . (1.1))))

  (setq modus-themes-common-palette-overrides
        '((border-mode-line-active bg-mode-line-active)
          (border-mode-line-inactive bg-mode-line-inactive)))

  ;; Blue background, neutral foreground, intense blue border
  ;; (setq modus-themes-common-palette-overrides
  ;;   '((bg-mode-line-active bg-blue-intense)
  ;;         (fg-mode-line-active fg-main)
  ;;         (border-mode-line-active blue-intense)))

  ;; Subtle blue background, neutral foreground, intense blue border
  (setq modus-themes-common-palette-overrides
        '((bg-mode-line-active bg-blue-subtle)
          (fg-mode-line-active fg-main)
          (border-mode-line-active blue-intense)))

  ;; Sage (green/cyan) background, neutral foreground, slightly distinct green border
  ;; (setq modus-themes-common-palette-overrides
  ;;   '((bg-mode-line-active bg-sage)
  ;;         (fg-mode-line-active fg-main)
  ;;         (border-mode-line-active bg-green-intense)))

  ;; As above, but with a purple style
  ;; (setq modus-themes-common-palette-overrides
  ;;   '((bg-mode-line-active bg-lavender)
  ;;         (fg-mode-line-active fg-main)
  ;;         (border-mode-line-active bg-magenta-intense)))

  ;; ;; As above, but with an earthly style
  ;; (setq modus-themes-common-palette-overrides
  ;;   '((bg-mode-line-active bg-ochre)
  ;;         (fg-mode-line-active fg-main)
  ;;         (border-mode-line-active bg-yellow-intense)))
  
  (if (eq system-type 'darwin)
      (load-theme 'modus-vivendi t nil)
    (load-theme 'modus-operandi t nil))
  )


(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier nil)
  (progn
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    ))

;; y/n for  answering yes/no questions
(fset 'yes-or-no-p 'y-or-n-p)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Tab.space equivalence
(setq-default tab-width 4)

;; Buffer encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment   'utf-8)

;; Unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse
      uniquify-separator " • "
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;; Default shell in term
(unless
    (or (eq system-type 'windows-nt)
        (not (file-exists-p "/bin/zsh")))
  (setq-default shell-file-name "/bin/zsh")
  (setq explicit-shell-file-name "/bin/zsh"))

;; Kill term buffer when exiting
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(if (boundp 'set-fringe-style)
    (set-fringe-style '(24 . 0)))

(if (boundp 'set-window-margins)
    (set-window-margins nil 0 3))

(global-display-line-numbers-mode -1)
(setq widget-image-enable nil)

(if (eq system-type 'darwin)
    (progn
      (set-face-font 'default "IBM Plex Mono-23:weight=Light")
      (set-face-font 'fixed-pitch "IBM Plex Mono-23:weight=Light")
      (set-face-font 'variable-pitch "IBM Plex Serif-23:weight=Light")
      (set-face-font 'font-lock-keyword-face "IBM Plex Mono-23:weight=DemiBold")
      (set-face-font 'font-lock-string-face "IBM Plex Sans-23:slant=italic:weight=Light")
      (set-face-font 'font-lock-comment-face "IBM Plex Serif-23:weight=Light:slant=italic")
      (set-face-font 'line-number "IBM Plex Mono-12:weight=ExtraLight")
      (setf line-spacing 0.2))
  (progn
    (set-face-font 'default "IBM Plex Mono-10:weight=Light")
    (set-face-font 'fixed-pitch "IBM Plex Mono-10:weight=Light")
    (set-face-font 'variable-pitch "IBM Plex Serif-10:weight=Light")
    (set-face-font 'font-lock-keyword-face "IBM Plex Mono-10:weight=Medium")
    (set-face-font 'font-lock-comment-face "IBM Plex Serif-10:weight=Light:slant=italic")
    (set-face-font 'line-number "IBM Plex Mono-6:weight=ExtraLight")
    ;; (set-face-attribute 'line-number nil :box '(:line-width (2 . 0)))
    ;; (set-face-background 'line-number (face-background 'mode-line))
    ;; (set-face-foreground 'line-number (face-foreground 'mode-line))
    ;; (set-face-background 'line-number-current-line (face-background 'mode-line-emphasis))
    ;; (set-face-foreground 'line-number-current-line (face-foreground 'mode-line-emphasis))
    (setf line-spacing 0.15)))

(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here


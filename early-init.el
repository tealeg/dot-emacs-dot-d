;;; early-init.el --- Emacs 27 and later run this file very early in startup.
;;;
;;; Commentary:
;;;     Runs prior to the setup of package management and any UI, so a good
;;;     place to do fundamental things like GC tweaking for load time.
;;;
;;; Code:

;; Turn of GC during startup and reenable after emacs is initialised.
;; This will speed up startup.
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook (lambda ()
			     (setq gc-cons-threshold 800000)))

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

;; System default coding
(set-language-environment 'utf-8)

;; Load theme early to avoid the blinking
;; (if (>= emacs-major-version 28)
;;     (load-theme 'modus-operandi t)
;;   (load-theme 'leuven t))

;; Cleaner GUI
(unless (eq system-type 'darwin)
  (menu-bar-mode -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(add-to-list 'initial-frame-alist '(font . "IBM Plex Mono-14:Regular"))

;; Default frame settings
  (setq default-frame-alist
        (append (list
		 '(font . "IBM Plex Mono-14:Regular")
		 '(ns-transparent-titlebar . t)
		 '(ns-appearance . dark)
                 '(min-height . 1)  '(height . 45)
                 '(min-width  . 1)  '(width  . 81)
                 '(vertical-scroll-bars . nil)
                 '(internal-border-width . 24)
                 '(left-fringe . 0)
                 '(right-fringe . 0)
                 '(undecorated-round . t) ;; emacs-plu@29 only
                 '(tool-bar-lines . 0)
                 '(menu-bar-lines . 0))))

  ;; Line spacing (in pixels)
  ;; (setq line-spacing 0)

  ;; Vertical window divider
  (setq window-divider-default-right-width 24)
  (setq window-divider-default-places 'right-only)
  (window-divider-mode 1)

  ;; ;; Nicer glyphs for continuation and wrap
  ;; (set-display-table-slot standard-display-table
  ;;                         'truncation (make-glyph-code ?… 'nano-faded))
  ;; (set-display-table-slot standard-display-table
  ;;                         'wrap (make-glyph-code ?- 'nano-faded))

;;; early-init.el ends here

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

;; Stop built in package manager messing with straight
(setq package-enable-at-startup nil)

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

;; System default coding
(set-language-environment 'utf-8)

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
              "[ \t\n]*$" "" (shell-command-to-string
                      "$SHELL --login -c 'echo $PATH'"
                            ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

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

(setq tealeg--frame-alist (list
		 '(font . "IBM Plex Mono-16:Regular")
		 '(ns-transparent-titlebar . t)
		 '(ns-appearance . light)
                 '(min-height . 1)  '(height . 25)
                 '(min-width  . 1)  '(width  . 81)
                 '(vertical-scroll-bars . nil)
                 '(internal-border-width . 30)
                 '(left-fringe . 30)
                 '(right-fringe . 30)
                 '(undecorated-round . t) ;; emacs-plu@29 only
                 '(tool-bar-lines . 0)
                 '(menu-bar-lines . 0)))
(setq initial-frame-alist tealeg--frame-alist)
(setq default-frame-alist tealeg--frame-alist)

  ;; Line spacing (in pixels)
(setq line-spacing 7)

  ;; Vertical window divider
(setq window-divider-default-right-width 30)
(setq window-divider-default-bottom-width 30)
(setq window-divider-default-places 'right-only)
(window-divider-mode -1)


(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
   '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)


  ;; ;; Nicer glyphs for continuation and wrap
  ;; (set-display-table-slot standard-display-table
  ;;                         'truncation (make-glyph-code ?… 'nano-faded))
  ;; (set-display-table-slot standard-display-table
  ;;                         'wrap (make-glyph-code ?- 'nano-faded))

(setq custom-file "~/.config/emacs/custom.el")
(when (file-exists-p custom-file)
  
  (load custom-file))


;;; early-init.el ends here

;;; tealeg--edit -- general editing setup
;;;
;;; Commentary:
;;;     Everything that doesn't fit elsewhere ;-)
;;;
;;; Code:

(straight-use-package 'string-inflection)

(require 'string-inflection)

(global-visual-line-mode -1)
(setq custom-tab-width 2)


(defun disable-tabs ()
  "Disallow the insertion of tabs."
  (interactive)
  (setq indent-tabs-mode nil))

(defun enable-tabs  ()
  "Allow the insertion of tabs."
  (interactive)
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'disable-tabs)


;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)


;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 (list 'whitespace-tab (list (list t (list :foreground (face-foreground 'font-lock-comment-face) :background (face-background 'font-lock-comment-face))))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'

(global-whitespace-mode) ; Enable whitespace mode everywhere

(provide 'tealeg--edit)
;;; tealeg--edit.el ends here

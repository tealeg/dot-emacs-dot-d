;;; tealeg--tabs --- define buffer tabs
;;;
;;; Commentary:
;;;     Setup centaur tabs, to my taste.
;;;
;;; Code:
(straight-use-package 'centaur-tabs)
(straight-use-package 'all-the-icons)

(require 'diff-mode)
(require 'centaur-tabs)
(require 'centaur-tabs-functions)

(setq centaur-tabs-set-bar nil
      centaur-tabs-set-icons nil
      centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker "💾"
      )

(defun tealeg--apply-tabs-theme (orig &rest args)
  "Update centaur tabs theme based on enabled theme."
  (let ((result (apply orig args)))
    (progn 
      (set-face-background 'tab-line (face-background 'diff-changed-unspecified))
      (set-face-foreground 'tab-line (face-foreground 'diff-changed-unspecified))
      (set-face-background 'centaur-tabs-unselected (face-background 'diff-changed-unspecified))
      (set-face-foreground 'centaur-tabs-unselected (face-foreground 'diff-changed-unspecified))
      (set-face-background 'centaur-tabs-selected (face-background 'default))
      (set-face-foreground 'centaur-tabs-selected (face-foreground 'default))
      (set-face-background 'centaur-tabs-unselected-modified (face-background 'diff-changed-unspecified))
      (set-face-foreground 'centaur-tabs-unselected-modified (face-foreground 'font-lock-variable-name-face))
      (set-face-background 'centaur-tabs-selected-modified (face-background 'font-lock-keyword-face))
      (set-face-foreground 'centaur-tabs-selected-modified (face-foreground 'font-lock-keyword-face))
      (set-face-background 'centaur-tabs-modified-marker-selected (face-background 'font-lock-keyword-face))
      (set-face-foreground 'centaur-tabs-modified-marker-selected (face-foreground 'font-lock-keyword-face))
      (set-face-background 'centaur-tabs-modified-marker-unselected (face-background 'diff-changed-unspecified))
      (set-face-foreground 'centaur-tabs-modified-marker-unselected (face-foreground 'diff-changed-unspecified))
      (set-face-background 'centaur-tabs-active-bar-face (face-foreground 'font-lock-constant-face))
      (set-face-foreground 'centaur-tabs-active-bar-face (face-foreground 'font-lock-constant-face))
      )
    result))

(advice-add 'load-theme :around #'tealeg--apply-tabs-theme)
(advice-add 'disable-theme :around #'tealeg--apply-tabs-theme)

(global-set-key (kbd "C-<prior>") #'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") #'centaur-tabs-forward)

(centaur-tabs-mode t)

(provide 'tealeg--tabs)
;;; tealeg--tabs.el ends here

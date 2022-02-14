;;; tealeg--tabs --- define buffer tabs
;;;
;;; Commentary:
;;;     Setup centaur tabs, to my taste.
;;;
;;; Code:
(straight-use-package 'centaur-tabs)
(straight-use-package 'all-the-icons)

(require 'centaur-tabs)
(require 'centaur-tabs-functions)

(setq centaur-tabs-set-bar nil
      centaur-tabs-set-icons nil
      centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker "💾"
      )

(set-face-background 'tab-line (face-background 'centaur-tabs-default))
(set-face-foreground 'tab-line (face-foreground 'default))
(set-face-background 'centaur-tabs-unselected (face-background 'centaur-tabs-default))
(set-face-foreground 'centaur-tabs-unselected (face-foreground 'font-lock-comment-face))
(set-face-background 'centaur-tabs-selected (face-background 'default))
(set-face-foreground 'centaur-tabs-selected (face-foreground 'default))
(set-face-background 'centaur-tabs-unselected-modified (face-background 'centaur-tabs-default))
(set-face-foreground 'centaur-tabs-unselected-modified (face-foreground 'font-lock-variable-name-face))
(set-face-background 'centaur-tabs-selected-modified (face-background 'default))
(set-face-foreground 'centaur-tabs-selected-modified (face-foreground 'font-lock-keyword-face))
(set-face-background 'centaur-tabs-modified-marker-selected (face-background 'default))
(set-face-foreground 'centaur-tabs-modified-marker-selected (face-foreground 'font-lock-keyword-face))
(set-face-background 'centaur-tabs-modified-marker-unselected (face-background 'centaur-tabs-default))
(set-face-foreground 'centaur-tabs-modified-marker-unselected (face-foreground 'font-lock-variable-name-face))
(set-face-background 'centaur-tabs-active-bar-face (face-foreground 'font-lock-constant-face))
(set-face-foreground 'centaur-tabs-active-bar-face (face-foreground 'font-lock-constant-face))

(global-set-key (kbd "C-<prior>") #'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") #'centaur-tabs-forward)

(centaur-tabs-mode t)

(provide 'tealeg--tabs)
;;; tealeg--tabs.el ends here

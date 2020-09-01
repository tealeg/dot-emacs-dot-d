;;; tealeg-org -- setup org mode
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'ox-jira)

(require 'org)
(require 'org-agenda)
(require 'ox-md)
(require 'ox-jira)
(require 'flyspell)
(require 'face-remap)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "BLOCKED" "|" "DONE" "CANCELED")))
(setq org-agenda-files '("~/Dropbox/HDI/projects/rds-scaling.org"))

(defun org-mode-helper-f ()
  "Setup 'org-mode'."
  (flyspell-mode 1)
  (variable-pitch-mode 1))

(add-hook 'org-mode-hook 'org-mode-helper-f)

(provide 'tealeg-org)
;;; tealeg-org.el ends here

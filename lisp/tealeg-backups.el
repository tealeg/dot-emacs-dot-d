;;; tealeg-backups --- automatic file backups
;;;
;;; Commentary:
;;;     Configure emacs automatic backup functionaliy
;;;
;;; Code:

(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      vc-make-backup-files t
      auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t)))

(provide 'tealeg-backups)
;;; tealeg-backups.el ends here

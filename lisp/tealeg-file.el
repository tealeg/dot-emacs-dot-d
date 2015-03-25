;;; tealeg-file --- my file settings.
;;;
;;; Commentary:
;;;     File setup

;;; Code:

(require 'uniquify)

(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$\\|.*\\.pyc$"))

(provide 'tealeg-file)
;;; tealeg-file.el ends here

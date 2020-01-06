;;; tealeg-custom-file -- configuration of the emacs custom file
;;;
;;; Commentary:
;;;     I tend not to use the Emacs custom file, but some things
;;;	(notably themes) require it to be set up.  I like it to be in
;;;	a specific, non-standard location, because of reasons.
;;;
;;; Code:

(setq custom-file "~/.emacs.d/emacs-custom.el")

;; This just stops this erroring the first time you load emacs
(unless (file-exists-p custom-file)
  (with-temp-buffer
    (insert ";; emacs-custom.el")
    (write-file custom-file nil)))

(load custom-file)

(provide 'tealeg-custom-file)
;;; tealeg-custom-file.el ends here

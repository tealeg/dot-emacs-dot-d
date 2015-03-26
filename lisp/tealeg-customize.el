;;; tealeg-customize -- save emacs customisations outside init.el
;;;
;;; Commentary:
;;;    Initialise a special file to save emacs-customisation values in
;;;    and prevent the pollution of init.el.
;;;
;;; Code:
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)
(provide 'tealeg-customize)
;;; tealeg-customize.el ends here

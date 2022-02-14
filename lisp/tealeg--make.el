;;; tealeg--make --- setup makefile support
;;;
;;; Commentary:
;;;     Because I disable tabs, in general, I explicitly
;;;     enable them for Makefiles, where they form a crucial part of
;;;     the syntax (more's the pity).
;;;
;;; Code:

(require 'make-mode)
(require 'tealeg--edit)

(defun make-mode-helper-f ()
  "Enable tabs when entering a Makefile."
  (enable-tabs))

(add-hook 'makefile-mode-hook #'make-mode-helper-f)

(provide 'tealeg--make)
;;; tealeg--make.el ends here.

;;; tealeg--comint -- colorize compilation output
;;;
;;; Commentary:
;;;     Make compile output pretty
;;;
;;; Code:

(require 'ansi-color)
(require 'comint)
(require 'compile)

(defun colorise-compilation-buffer ()
  "Apply ANSI color interpretation to the compilation output."
  (read-only-mode -1)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (read-only-mode 1))

(add-hook 'compilation-filter-hook #'colorise-compilation-buffer)

(provide 'tealeg--comint)
;;; tealeg--comint.el ends here

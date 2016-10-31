;;; tealeg-autocompile --- Autocompile Elisp files, when changed
;;;
;;; Commentary:
;;;     Autocompile setup

;;; Code:
(defun autocompile nil
  "Cause Elisp to recompile itself when saved."
  (interactive)
  (require 'bytecomp)
  (let ((fname (file-name-nondirectory (buffer-file-name))))
    (if (or (and (string-prefix-p "tealeg-" fname)
                 (string-suffix-p ".el" fname))
            (string-suffix-p "init.el" fname))
        (byte-compile-file fname))))

(add-hook 'after-save-hook 'autocompile)

(provide 'tealeg-autocompile)
;;; tealeg-autocompile.el ends here

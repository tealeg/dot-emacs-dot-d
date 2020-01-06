;;; tealeg-common-lisp.el -- common lisp coding config
;;;
;;; Commentary:
;;;	Setup SLIME, etc..
;;;
;;; Code:
(let ((slime-helper-file "~/quicklisp/slime-helper.el"))
  (if (file-exists-p slime-helper-file)
      (load-file slime-helper-file)))


(provide 'tealeg-common-lisp)
;;; tealeg-common-lisp.el ends here

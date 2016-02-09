;;; tealeg-lisp --- setup for Common Lisp programming
;;;
;;; Commentary:
;;;        Some essential CL setup, including SLIME
;;;
;;; Code:
;;(require 'parinferlib)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/bin/sbcl")

(setq common-lisp-hyperspec-root "/usr/share/doc/hyperspec/")
(setq common-lisp-hyperspec-symbol-table
      (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))


(provide 'tealeg-lisp)
;;; tealeg-lisp.el ends here

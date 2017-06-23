;;; tealeg-lisp --- setup for Common Lisp programming
;;;
;;; Commentary:
;;;        Some essential CL setup, including SLIME
;;;
;;; Code:
;;(require 'parinferlib)
(require 'paredit)
(require 'geiser)
(require 'geiser-mode)

(customize-set-variable 'geiser-default-implementation 'guile)


;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/bin/sbcl")

(setq common-lisp-hyperspec-root "/usr/share/doc/hyperspec/")
(setq common-lisp-hyperspec-symbol-table
      (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))

(defun tealeg-geiser-helpers-f ()
  "Set up geiser for use."
  (paredit-mode 1)
  (run-geiser))


(add-hook 'geiser-mode-hook 'tealeg-geiser-helpers-f)

(provide 'tealeg-lisp)
;;; tealeg-lisp.el ends here

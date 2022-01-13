;;; tealeg--lisp -- setup for elisp editing
;;;
;;; Commentary:
;;;	Emacs Lisp code matters too.
;;;
;;; Code:


(straight-use-package 'flycheck)
(require 'flyspell)
(require 'flycheck)
(require 'paren)
(require 'elec-pair)

(defun emacs-lisp-helper-f ()
  "Config lisp-mode"
  (flycheck-mode 1)
  (show-paren-mode 1)
  (electric-pair-mode 1)
  (flyspell-prog-mode 1)
  )

(add-hook 'lisp-mode #'emacs-lisp-helper-f)

(provide 'tealeg--lisp)
;;; tealeg--lisp.el ends here.

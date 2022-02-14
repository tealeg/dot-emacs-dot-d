;;; tealeg--lisp -- setup for elisp editing
;;;
;;; Commentary:
;;;	Emacs Lisp code matters too.
;;;
;;; Code:


(straight-use-package 'flycheck)
(straight-use-package 'elsa)
(straight-use-package 'flycheck-elsa)
(require 'flyspell)
(require 'flycheck)

(require 'paren)
(require 'elec-pair)
(require 'flycheck-elsa)
(require 'elisp-mode)

(defun emacs-lisp-helper-f ()
  "Config lisp-mode"
  (flycheck-mode 1)
  (flycheck-elsa-setup)
  (show-paren-mode 1)
  (electric-pair-mode 1)
  (flyspell-prog-mode)
  )

(add-hook 'emacs-lisp-mode-hook #'emacs-lisp-helper-f)

(provide 'tealeg--lisp)
;;; tealeg--lisp.el ends here.

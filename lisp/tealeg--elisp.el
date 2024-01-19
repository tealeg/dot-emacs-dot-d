;;; tealeg--elisp --- Setup for Emacs Lisp editing.
;;;
;;; Commentary:
;;;
;;; Code:

(elpaca nil
  (require 'elisp-mode)
  (require 'flymake)
  (require 'eldoc-box)
  (require 'sideline)
  (require 'flyspell)

  (defun tealeg--elisp-mode-helper-f ()
    "Setup \"emacs-lisp-mode\"."
    (flymake-mode 1)
    (eldoc-box-hover-at-point-mode 1)
    (sideline-mode 1)
    (flyspell-prog-mode)
    )

  (add-hook 'emacs-lisp-mode-hook #'tealeg--elisp-mode-helper-f))


(provide 'tealeg--elisp)
;;; tealeg--elisp.el ends here.

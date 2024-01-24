;;; tealeg--elisp --- Setup for Emacs Lisp editing.
;;;
;;; Commentary:
;;;
;;; Code:

(elpaca nil
  (require 'elisp-mode)
  (require 'flymake)
  (require 'eldoc-box)
  (require 'flyspell)

  (defun tealeg--elisp-mode-helper-f ()
    "Setup \"emacs-lisp-mode\"."
    (flymake-mode 1)
    (flyspell-prog-mode)
    (unbind-key "C-?" rust-mode-map)
    (bind-key "C-?" #'eldoc-box-help-at-point rust-mode-map)
    )

  (add-hook 'emacs-lisp-mode-hook #'tealeg--elisp-mode-helper-f))


(provide 'tealeg--elisp)
;;; tealeg--elisp.el ends here.

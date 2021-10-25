;;; tealeg--racket -- setup emacs for racket
;;;
;;; Commentary:
;;;	Setup scheme-mode, quack and geiser for Racket coding.
;;; Code:

(straight-use-package 'racket-mode)
(straight-use-package 'paredit)

(defun tealeg--racket-mode-helper-f ()
  "Setup racket mode"
  (require 'paredit)
  (paredit-mode 1)
  )

(add-hook 'racket-mode-hook #'tealeg--scheme-mode-helper-f)

(provide 'tealeg--racket)
;;; tealeg--racket.el ends here


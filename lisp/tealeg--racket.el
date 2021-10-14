;;; tealeg--racket -- setup emacs for racket
;;;
;;; Commentary:
;;;	Make a racket!
;;;
;;; Code:

(straight-use-package 'quack)
(straight-use-package 'geiser)
(straight-use-package 'geiser-racket)
(straight-use-package 'paredit)

(require 'quack)

(defun tealeg--quack-mode-helper-f ()
  (enable-paredit-mode)
  )

(add-hook 'quack-pltfile-mode-hook #'tealeg--quack-mode-helper-f)


(provide 'tealeg--racket)
;;; tealeg--racket.el ends here

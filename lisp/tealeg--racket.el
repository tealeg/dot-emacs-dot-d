;;; tealeg--racket -- setup emacs for racket
;;;
;;; Commentary:
;;;	Make a racket!
;;;
;;; Code:

(straight-use-package 'racket-mode)
;; (straight-use-package 'paredit)
(straight-use-package 'flycheck)

(require 'tealeg--lsp)

(defun tealeg--racket-mode-helper-f ()
  "Setup racket mode"
  ;; (require 'paredit)
  ;; (paredit-mode 1)
  (electric-pair-mode 1)
  (flycheck-mode 1)
  )

(add-hook 'racket-mode-hook #'tealeg--racket-mode-helper-f)
;; (add-hook 'racket-mode-hook #'lsp)


(provide 'tealeg--racket)
;;; tealeg--racket.el ends here



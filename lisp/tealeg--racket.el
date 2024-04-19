(use-package racket-mode)

(elpaca nil
  (defun tealeg--racket-mode-helper-f ()
    (require 'racket-xp)
    (racket-xp-mode 1))

  (add-hook 'racket-mode-hook #'tealeg--racket-mode-helper-f)
  )
    


(provide 'tealeg--racket)

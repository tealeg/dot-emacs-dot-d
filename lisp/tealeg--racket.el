(use-package racket-mode
  :config

  (defun tealeg--racket-mode-helper-f ()
    (require racket-xp-mode)
    (racket-xp-mode 1))

  (add-hook 'racket-mode-hook #'tealeg--racket-mode-helper-f)
  )
    


(provide 'tealeg--racket)

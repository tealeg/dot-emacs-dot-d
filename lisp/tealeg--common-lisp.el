(use-package sly
  :config
  (setq inferior-lisp-program "/opt/homebrew/bin/sbcl")
  (eval-after-load 'sly
  `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup)))


(provide 'tealeg--common-lisp)

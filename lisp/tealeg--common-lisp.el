(use-package sly
  :config
  (if (eq system-type 'darwin)
      (setq inferior-lisp-program "/opt/homebrew/bin/sbcl")
    (setq inferior-lisp-program "/usr/bin/sbcl"))
  (eval-after-load 'sly
  `(define-key sly-prefix-map (kbd "M-h") 'sly-documentation-lookup)))


(provide 'tealeg--common-lisp)

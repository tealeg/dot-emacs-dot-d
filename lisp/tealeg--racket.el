(use-package paredit)

(use-package racket-mode
  :after paredit
  :config

  (require 'font-lock)


  (defun tealeg--racket-mode-helper-f ()
    (require 'racket-xp)
    (racket-xp-mode 1))
  

  (defun tealeg--racket-hash-lang-mode-helper-f (module-language)
    (message "HASH LANG")
    (message "Module Lang: %s\n" module-language)
    (let ((rackety
           (member module-language
                   (list "racket" "racket/base"
                         "typed/racket" "typed/racket/base")))
          (forgey
           ;; Forge doesn't play well with racket's module-reader
           (save-excursion
             (goto-char (point-min))
             (let ((beg (point)))
               (forward-line 1)
               (let ((lang (buffer-substring-no-properties beg (point))))
                 (string< "#lang forge" lang))))))
      (message "rackety %s \nforgey %s\n" rackety forgey)
      (if rackety
          (paredit-mode 1)
        (paredit-mode -1))
      (when forgey
        (progn 
          (setq-local racket-xp-add-binding-faces t)
          (setq font-lock-maximum-decoration 0))
          )
      ))

  (add-hook 'racket-hash-lang-module-language-hook #'tealeg--racket-hash-lang-mode-helper-f)

  (add-hook 'racket-mode-hook #'tealeg--racket-mode-helper-f)
  (add-to-list 'auto-mode-alist '("\\.frg\\'" . racket-hash-lang-mode))
  )
    


(provide 'tealeg--racket)


(use-package racket-mode
  :elpaca t
  :mode ("\\.rkt\\'" . racket-mode)
  :hook (racket-xp-mode)
  :config
  (setq racket-racket-program "/usr/bin/racket")
  (setq racket-raco-program "/usr/bin/raco"))


;; (use-package geiser
;;   :ensure t)
;; (use-package geiser-racket
;;   :ensure t)
;; (use-package quack)
;; (use-package ac-geiser)

;; (require 'geiser)
;; (require 'geiser-racket)
;; (require 'quack)
;; (require 'ac-geiser)


(provide 'tealeg--racket)

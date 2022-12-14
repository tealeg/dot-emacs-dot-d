;;; tealeg--spelling -- configure the spellchecker
;;;
;;; Commentary:
;;;     Setup ispell and the flyspell interface to it.
;;;
;;; Code:

(straight-use-package 'flyspell-correct-ivy)
(require 'ispell)
(require 'flyspell)

 (require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)

(setq ispell-program-name "aspell"
 ispell-personal-dictionary "~/.emacs.d/personal-dictionary"
      ispell-dictionary "british")


(provide 'tealeg--spelling)
;;; tealeg--spelling.el ends here.

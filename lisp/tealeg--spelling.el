;;; tealeg--spelling -- configure the spellchecker
;;;
;;; Commentary:
;;;     Setup ispell and the flyspell interface to it.
;;;
;;; Code:

(require 'ispell)
(require 'flyspell)


(setq ispell-program-name "aspell"
 ispell-personal-dictionary "~/.emacs.d/personal-dictionary"
      ispell-dictionary "british")


(provide 'tealeg--spelling)
;;; tealeg--spelling.el ends here.

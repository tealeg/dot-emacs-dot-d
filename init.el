;;; init --- Top level setup for Emacs.
;;;
;;; Commentary:
;;;
;;; Code:

(add-to-list 'load-path (concat  user-emacs-directory "lisp"))

(require 'tealeg--elpaca)
(require 'tealeg--performance)
(require 'tealeg--org)
(require 'tealeg--dashboard)
(require 'tealeg--tree-sitter)
(require 'tealeg--appearance)
(require 'tealeg--vc)

(require 'tealeg--c)
(require 'tealeg--comint)
(require 'tealeg--elisp)
(require 'tealeg--eshell)
(require 'tealeg--go)
(require 'tealeg--python)
(require 'tealeg--rust)
;; (require 'tealeg--sway)
(require 'tealeg--rainbow)
(require 'tealeg--speedbar)
(require 'tealeg--markdown)

(provide 'init)
;;; init.el ends here.

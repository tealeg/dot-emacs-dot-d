(add-to-list 'load-path (concat  user-emacs-directory "lisp"))

(require 'tealeg--elpaca)

(use-package tree-sitter-langs)
(require 'tealeg--appearance)
(require 'tealeg--python)
(require 'tealeg--vc)
(require 'tealeg--go)
(require 'tealeg--org)
(require 'tealeg--eshell)


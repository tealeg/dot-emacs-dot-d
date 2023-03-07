(add-to-list 'load-path "~/.config/emacs/lisp")

(require 'tealeg--package)
(require 'tealeg--appearance)
(require 'tealeg--litter)
(require 'tealeg--modern)
(require 'tealeg--vc)
(require 'tealeg--go)
(require 'tealeg--org)
(require 'tealeg--scheme)

(if (not (boundp 'server-process))
    (server-start))

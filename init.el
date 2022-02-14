;;; init -- core initialisation of emacs
;;;
;;; Commentary:
;;;     Basically, everything starts here!
;;;
;;; Code:
(setq gc-cons-threshold 120000000)
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'tealeg--package)
(require 'tealeg--custom-file)
(require 'tealeg--backups)
(require 'tealeg--env)
(require 'tealeg--spelling)
(require 'tealeg--edit)
(require 'tealeg--syntax)
(require 'tealeg--make)
(require 'tealeg--vc)
(require 'tealeg--lsp)
(require 'tealeg--comint)
(require 'tealeg--racket)
(require 'tealeg--markdown)
(require 'tealeg--typescript)
(require 'tealeg--yaml)
(require 'tealeg--org)
(require 'tealeg--lisp)
(require 'tealeg--go)
(require 'tealeg--racket)
(require 'tealeg--zig)
(require 'tealeg--rust)
(require 'tealeg--eshell)
(require 'tealeg--guix)
;;(require 'tealeg--irc)
(require 'tealeg--appearance)
(require 'tealeg--tabs)
(require 'tealeg--scheme)

(require 'tealeg--selectrum)


(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;;; init.el ends here

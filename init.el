;;; init.el -- the core of the Emacs configuration. -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;     This is where it all begins folks (actually there's early-init.el before this, but mostly you can ignore that).
;;;
;;; Code:
(when (eq system-type 'darwin)
  (sleep-for 1.0)) ;; prevent a random crash on Mac OS X
(add-to-list 'load-path "~/.config/emacs/lisp")
(setq user-mail-address "tealeg@t-online.de")
(require 'tealeg--elpaca)
(elpaca-wait)
(require 'tealeg--org)
(require 'tealeg--litter)
(require 'tealeg--performance)
(require 'tealeg--bell)
(require 'tealeg--tree-sitter)
(require 'tealeg--completion)
(require 'tealeg--location)

(require 'tealeg--dired)

(require 'tealeg--spelling)
(require 'tealeg--eshell)
(require 'tealeg--compilation)
(require 'tealeg--appearance)
(require 'tealeg--emoji)
(require 'tealeg--eldoc)
(require 'tealeg--magit)

(require 'tealeg--rainbow)
;; (require 'tealeg--elisp)
(require 'tealeg--python)
(require 'tealeg--racket)
(require 'tealeg--common-lisp)
(require 'tealeg--markdown)
(require 'tealeg--languagetool)
(require 'tealeg--go)
(require 'tealeg--rust)
(require 'tealeg--rest)
(require 'tealeg--css)
(require 'tealeg--yas)

(require 'tealeg--nxml)
(require 'tealeg--yaml)
(require 'tealeg--typespec)

(require 'tealeg--mail)
(provide 'init)
;;; init.el ends here.

;;; init.el -- the root of my emacs configuration
;;;
;;; Commentary:
;;;	Everything starts here! My intent is that this file should
;;;	contain as little as possible, hopefully just requiring a
;;;	series of more specific configuration files.
;;;
;;; Code:

;; We do this for performance reasons - I have many GB to spare,
;; we don't need to collect garbage so aggressively.
(setq gc-cons-threshold 120000000)

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'tealeg-package-management)
(require 'tealeg-custom-file)
(require 'tealeg-text-encoding)
(require 'tealeg-backups)
(require 'tealeg-counsel)
(require 'tealeg-checking)
(require 'tealeg-appearance)
(require 'tealeg-vc)
(require 'tealeg-eshell)
(require 'tealeg-lsp)
(require 'tealeg-go)
(require 'tealeg-rust)
(require 'tealeg-yaml)
(require 'tealeg-avsc)
(require 'tealeg-crypto)
(require 'tealeg-haskell)
(require 'tealeg-cfn)
(require 'tealeg-terraform)

(provide 'init)
;;; init.el ends here

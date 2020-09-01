;;; tealeg-yasnippet -- setup my custom snippets
;;;
;;; Commentary:
;;;     I use yasnippet to provide structural snippet completion.
;;;     Custom snippets are defined, per mode, in "~/.emacs.d/snippets".
;;; Code:

(straight-use-package 'yasnippet)

(require 'yasnippet)

(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")

(provide 'tealeg-yasnippet)
;;; tealeg-yasnippet.el ends here

;;; tealeg--go -- Go setup for emacs
;;;
;;; Commentary:
;;;	Setup Go support
;;;
;;; Code:


(straight-use-package 'go-mode)
(require 'me-alpheus-gotags)

(defun go-mode-helper-f ()
  (local-set-key (kbd "s-.") #'me.alpheus/gotags/tag-search))

(add-hook 'go-mode-hook #'go-mode-helper-f)

(provide 'tealeg--go)
;;; tealeg--go.el ends here

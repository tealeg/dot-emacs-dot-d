;;; tealeg--markdown -- configure emacs for markdown use
;;;
;;; Commentary:
;;;	Setup markdown mode
;;;
;;; Code:

(straight-use-package 'markdown-mode)
(straight-use-package 'markdown-mode+)

(require 'markdown-mode)
(require 'markdown-mode+)
(require 'flyspell)
(require 'simple)

(defun tealeg--markdown-mode-hook-f ()
  "Run setup for markdown"
  (flyspell-mode 1))

(add-hook 'markdown-mode-hook #'tealeg--markdown-mode-hook-f)

(provide 'tealeg--markdown)

;;; tealeg--markdown.el ends here 

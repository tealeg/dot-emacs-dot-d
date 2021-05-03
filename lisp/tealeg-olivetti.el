;;; tealeg-olivetti --- configure authoring mode
;;;
;;; Commentary:
;;;	Olivettig mode is a nice setup for writing books.
;;;
;;; Code:
(straight-use-package 'olivetti)
(straight-use-package 'flyspell)

(defun tealeg-olivetti-helper-f ()
  "Helper function to configure olvetti mode."
  (flyspell-mode 1))

(add-hook 'olivetti-mode-hook #'tealeg-olivetti-helper-f)

(provide 'tealeg-olivetti)
;;; tealeg-olivetti.el ends here

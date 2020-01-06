;;; tealeg-rust.el -- rust specific emacs configuration
;;;
;;; Commentary:
;;;	Blah, blah, get you rust here...
;;;
;;; Code:


(straight-use-package 'lsp-mode)
(straight-use-package 'rust-mode)

(defun rust-mode-helpers ()
  "Setup rust mode."
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil))

(add-hook 'rust-mode-hook #'rust-mode-hook)

(provide 'tealeg-rust)
;;; tealeg-rust.el ends here

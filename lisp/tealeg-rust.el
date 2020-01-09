;;; tealeg-rust.el -- rust specific emacs configuration
;;;
;;; Commentary:
;;;	Blah, blah, get you rust here...
;;;
;;; Code:


(straight-use-package 'lsp-mode)
(straight-use-package 'rust-mode)
(straight-use-package 'flycheck-rust)


(defun rust-mode-helpers ()
  "Setup rust mode."
  (lsp)
  (flycheck-mode 1)
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil))

(add-hook 'rust-mode-hook #'rust-mode-helpers)

(provide 'tealeg-rust)
;;; tealeg-rust.el ends here

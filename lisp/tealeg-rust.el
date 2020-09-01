;;; tealeg-rust.el -- rust specific emacs configuration
;;;
;;; Commentary:
;;;	Blah, blah, get you rust here...
;;;
;;; Code:
(straight-use-package 'lsp-mode)
(straight-use-package 'rust-mode)
(straight-use-package 'flycheck-rust)

(require 'rust-mode)

(defun rust-mode-helpers ()
  "Setup rust mode."
  (add-to-list 'exec-path "~/.cargo/bin")
  (lsp)
  (flycheck-mode 1)
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil))

(add-hook 'rust-mode-hook #'rust-mode-helpers)

(provide 'tealeg-rust)
;;; tealeg-rust.el ends here

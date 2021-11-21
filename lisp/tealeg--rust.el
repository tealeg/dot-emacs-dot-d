;;; tealeg--rust -- Rust setup for emacs
;;;
;;; Commentary:
;;;	Setup Rust support
;;;
;;; Code:

(straight-use-package 'rust-mode)
(straight-use-package 'rustfmt)
(straight-use-package 'flycheck)

(require 'rust-mode)
(require 'flycheck)
(require 'lsp)
(require 'rustfmt)

(defun rust-mode-helper-f ()
  (rustfmt-enable-on-save)
  )

(add-hook 'rust-mode-hook #'lsp)

(provide 'tealeg--rust)
;;; tealeg--rust.el ends here



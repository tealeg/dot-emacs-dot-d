;;; tealeg--zig -- configure support for Zig programming
;;;
;;; Commentary:
;;;     Zig is a really promising systems programming language.
;;;
;;; Code:
(straight-use-package 'zig-mode)

(require 'elec-pair)
(require 'flycheck)

(defun zig-mode-helper-f ()
  "Setup zig-mode"
  (setq zig-toggle-format-on-save 1)
  (electric-pair-mode 1)
  )

(add-hook 'zig-mode-hook #'lsp)
(add-hook 'zig-mode-hook #'zig-mode-helper-f)

(provide 'tealeg--zig)
;;; tealeg--zig.el ends here.

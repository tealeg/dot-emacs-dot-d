(straight-use-package 'zig-mode)
(require 'elec-pair)
(require 'flycheck)

(defun zig-mode-helper-f ()
  "Setup zig-mode"
  (electric-pair-mode 1)
  )

(add-hook 'zig-mode-hook #'lsp)
(add-hook 'zig-mode-hook #'zig-mode-helper-f)

(provide 'tealeg--zig)

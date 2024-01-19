
(use-package flymake-markdownlint)
(use-package markdown-mode)

(elpaca nil
  (require 'flyspell)

  (defun tealeg--markdown-mode-helper-f ()
    (flyspell-mode 1)
    (flymake-markdownlint-setup)
    (flymake-mode 1))

  (add-hook 'markdown-mode-hook #'tealeg--markdown-mode-helper-f))

(provide 'tealeg--markdown)


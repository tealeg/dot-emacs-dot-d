
(use-package flymake-markdownlint)
;; (use-package markdown-mode)
(use-package web-mode)

(elpaca nil
  (require 'flyspell)
  (require 'web-mode)
  (require 'electric)

  (defun tealeg--markdown-mode-helper-f ()
    (flyspell-mode 1)
    (flymake-markdownlint-setup)
    (flymake-mode 1)
    (web-mode 1)
    (web-mode-set-engine 'django)
    (electric-pair-mode 1)
    )

  (add-hook 'markdown-mode-hook #'tealeg--markdown-mode-helper-f))

(provide 'tealeg--markdown)


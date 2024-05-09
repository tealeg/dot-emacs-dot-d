(use-package jinx
  :hook (emacs-startup . global-jinx-mode)
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages))
  :config (setq jinx-languages "en_GB"))

(provide 'tealeg--spelling)

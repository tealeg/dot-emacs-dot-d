
(use-package yasnippet-snippets)
(use-package yasnippet
  :after yasnippet-snippets
  :config
  (setq yas-snippet-dirs (list "~/.config/emacs/elpaca/repos/yasnippet-snippets/snippets" "~/.config/emacs/etc/yasnippet/snippets"))
  (yas-reload-all)
  (yas-global-mode 1))




(provide 'tealeg--yas)

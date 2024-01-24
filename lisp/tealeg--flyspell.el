
(elpaca nil
  (require 'ispell)
  (require 'flyspell)

  (setenv "DICTIONARY" "en_GB")
  (setq ispell-dictionary "en_GB")

  (add-hook 'text-mode-hook #'flyspell-mode)
)

(provide 'tealeg--flyspell)

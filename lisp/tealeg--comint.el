
(require 'comint)
(require 'ansi-color)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'compilation-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
(provide 'tealeg--comint)

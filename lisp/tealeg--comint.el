(require 'ansi-color)
(require 'comint)
(require 'compile)

(defun colorise-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))

(add-hook 'compilation-filter-hook #'colorise-compilation-buffer)



(provide 'tealeg--comint)

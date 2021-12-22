;; (straight-use-package 'org-mode)

(require 'org)
(require 'org-tempo)
(require 'flyspell)

(defun org-mode-helper-f ()
  (flyspell-mode 1)
  (org-tempo-setup))

(add-hook 'org-mode-hook #'org-mode-helper-f)

(provide 'tealeg--org)

;;; tealeg-scheme -- configuration for Scheme development
;;;
;;; Commentary:
;;;	Setup for Scheme (Chez for now)
;;;
;;; Code:

(straight-use-package 'geiser)
(straight-use-package 'geiser-chez)
(straight-use-package 'paredit)
(straight-use-package 'macrostep-geiser)

(defun geiser-mode-helper-f ()
  (paredit-mode 1))

(add-hook 'geiser-mode-hook #'geiser-mode-helper-f)


(provide 'tealeg-scheme)
;;; tealeg-scheme.el ends here

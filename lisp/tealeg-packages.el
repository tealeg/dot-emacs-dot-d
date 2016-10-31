;;; tealeg-packages --- my packages settings.
;;;
;;; Commentary:
;;;     Packages setup

;;; Code:

(setq use-package-verbose t)
(setq use-package-always-ensure t)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(provide 'tealeg-packages)
;;; tealeg-packages.el ends here


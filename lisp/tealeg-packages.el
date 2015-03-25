;;; tealeg-packages --- my packages settings.
;;;
;;; Commentary:
;;;     Packages setup

;;; Code:
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)


(provide 'tealeg-packages)
;;; tealeg-packages.el ends here


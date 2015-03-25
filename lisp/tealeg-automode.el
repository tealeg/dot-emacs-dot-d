;;; tealeg-automode --- my automode settings.
;;;
;;; Commentary:
;;;     Automode setup

;;; Code:
(add-to-list 'auto-mode-alist
             '(".*-script.pt\\'" . js-mode))
(add-to-list 'auto-mode-alist
             '("\\.pt\\'" . html-mode))


(provide 'tealeg-automode)
;;; tealeg-automode.el ends here

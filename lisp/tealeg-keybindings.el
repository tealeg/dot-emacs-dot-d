;;; tealeg-keybindings --- my keybindings settings.
;;;
;;; Commentary:
;;;     Keybindings setup

;;; Code:

;; Don't suspend frames
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Don't switch to overwrite mode if I hit the insert key by mistake.
(put 'overwrite-mode 'disabled t)
(global-unset-key [insert])


(provide 'tealeg-keybindings)
;;; tealeg-keybindings.el ends here

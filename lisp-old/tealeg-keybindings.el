;;; tealeg-keybindings --- my keybindings settings.
;;;
;;; Commentary:
;;;     Keybindings setup

;;; Code:

(require 'tealeg-f)

;; Don't suspend frames
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Don't switch to overwrite mode if I hit the insert key by mistake.
(put 'overwrite-mode 'disabled t)
(global-unset-key [insert])

;; Use upcase-initials instead of capitalize-word
(global-unset-key (kbd "M-c"))
(global-set-key (kbd "M-c") 'capitalize-first-char)

(provide 'tealeg-keybindings)
;;; tealeg-keybindings.el ends here

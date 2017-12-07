;;; tealeg-keybindings --- my keybindings settings.
;;;
;;; Commentary:
;;;     Keybindings setup

;;; Code:

(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(when (string-equal system-type "darwin")
  ;; set keys for Apple keyboard, for emacs in OS X
  (setq mac-command-modifier 'meta) ; make cmd key do Meta
  (setq mac-option-modifier 'super) ; make opt key do Super
  (setq mac-control-modifier 'control) ; make Control key do Control
  (setq ns-function-modifier 'hyper)  ; make Fn key do Hyper
  )

;; Don't suspend frames
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Don't switch to overwrite mode if I hit the insert key by mistake.
(put 'overwrite-mode 'disabled t)
(global-unset-key [insert])

(provide 'tealeg-keybindings)
;;; tealeg-keybindings.el ends here

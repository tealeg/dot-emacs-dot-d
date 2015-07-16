;;; tealeg-mouse -- disable the touchpad whilst working in emacs.
;;;
;;; Commentary:
;;;   Disable the touchpad device whenever an emacs frame is in focus.
;;;
;;; Code:



(defcustom tealeg-mouse-xinput-name "DLL0665:01 06CB:76AD UNKNOWN"
  "The name of the Xinput device to enable/disable.

You can find this by looking at the output of 'xinput --list'."
  :group 'tealeg-mouse)

(defun turn-off-mouse ()
  "Disable the mouse device."
  (interactive)
  (shell-command (concat "xinput --disable \"" tealeg-mouse-xinput-name  "\"")))

(defun turn-on-mouse ()
  "Enable the mouse device."
  (interactive)
  (shell-command (concat "xinput --enable \"" tealeg-mouse-xinput-name "\"")))

(defun tealeg-mouse-turn-off-on-focus-in (&optional frame)
  "Turn off mouse when focussed on FRAME."
  (turn-off-mouse))


(defun tealeg-mouse-turn-on-on-focus-out (&optional frame)
  "Turn on mouse when focus lost on FRAME."
  (turn-on-mouse))



(add-hook 'focus-in-hook #'tealeg-mouse-turn-off-on-focus-in)
(add-hook 'focus-out-hook #'tealeg-mouse-turn-on-on-focus-out)
(add-hook 'delete-frame-functions #'tealeg-mouse-turn-on-on-focus-out)
(setq-default mouse-avoidance-mode 'banish)

(provide 'tealeg-mouse)
;;; tealeg-mouse.el ends here

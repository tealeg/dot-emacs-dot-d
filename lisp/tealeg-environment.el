;;; tealeg-environment --- manage the operational environment
;;;
;;; Commentary:
;;; 
;;;     This file attempts to set-up Emacs environment so that, for
;;;     example, it's exec-path matches the shell's PATH, and that
;;;     PATH is also set correctly within Emacs when launched by a
;;;     launcher that doesn't' know about the shell's configuration.
;;;
;;; Code:

(straight-use-package 'exec-path-from-shell)

(exec-path-from-shell-initialize)
(exec-path-from-shell-setenv "PATH" (string-join exec-path ":"))

(provide 'tealeg-environment)
;;; tealeg-environment.el ends here

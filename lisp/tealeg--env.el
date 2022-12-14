;;; tealeg-env -- environmental factors
;;;
;;; Commentary:
;;;	Shape Emacs to it's run time environment.
;;;
;;; Code:

(straight-use-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(setq visible-bell 1)
(provide 'tealeg--env)
;;; tealeg--env.el ends here

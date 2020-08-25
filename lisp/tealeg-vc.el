;;; tealeg-vc.el -- configure emacs based version control
;;;
;;; Commentary:
;;;	Anything to do with version control configuration lives here,
;;;	for the moment that means magit.
;;;
;;; Code:

(straight-use-package 'magit)
(setq magit-git-executable "/usr/bin/git")
(global-set-key (kbd "C-x g") 'magit-status)
(setq vc-handled-backends (delq 'Git vc-handled-backends))

(provide 'tealeg-vc)
;;; tealeg-vc.el ends here

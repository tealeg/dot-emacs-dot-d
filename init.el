;;; Package --- Summary
;;;
;;; Personal emacs settings.

;;; Commentary:
;;;
;;; Everything I need to make Emacs feel like home!

;;; Code:


;; This has to come first
(package-initialize)

;; This load's literate emacs config using Org-Mode.

(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   user-emacs-directory))
(provide 'init)
;;; init.el ends here


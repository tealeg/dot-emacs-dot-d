;;; tealeg--completion -- set up fancy completion
;;;
;;; Commentary:
;;;	We're not using helm or anything else like that.  Just some oldschool hippie-expand ;-)
;;;
;;; Code:


(straight-use-package '(hippie-completing-read :type git :host github :repo "duckwork/hippie-completing-read"))
(straight-use-package 'company)

(require 'hippie-exp)
(require 'hippie-completing-read)
(require 'company)

(global-company-mode 1)
(global-set-key (kbd "\M- ") #'hippie-expand)
(global-set-key (kbd "M-/") #'hippie-completing-read)


(provide 'tealeg--completion)
;;; tealeg--completion.el ends here


;;; tealeg-org -- setup org mode
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'ox-jira)
(straight-use-package 'org-plus-contrib)

(require 'org)
(require 'org-agenda)
(require 'org-contacts)
(require 'org-capture)
(require 'ox-md)
(require 'ox-jira)
(require 'flyspell)
(require 'face-remap)

(if (file-exists-p "~/src/hdi/c3-devcare-org/")
    (progn
      (add-to-list 'load-path "~/src/hdi/c3-devcare-org/")
      (require 'hdi-c3-devcare-config)))


(defun org-mode-helper-f ()
  "Setup 'org-mode'."
  (flyspell-mode 1)
  (variable-pitch-mode 1))

(add-hook 'org-mode-hook 'org-mode-helper-f)

(provide 'tealeg-org)
;;; tealeg-org.el ends here

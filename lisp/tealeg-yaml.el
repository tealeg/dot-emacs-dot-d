;;; tealeg-yaml -- all yaml related config
;;;
;;; Commentary:
;;	Somedays are worse than others, on the worst of days,
;;;	sometimes, you have no choice but to deal with YAML.
;;;	When such a day occurs, I'm glad I did tihs.
;;;
;;; Code:

(straight-use-package 'yaml-mode)

(add-to-list 'auto-mode-alist (cons "\\.yamp\\'"  'yaml-mode))

(provide 'tealeg-yaml)
;;; tealeg-yaml.el ends here

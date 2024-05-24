
(use-package org
  :config
  (setq org-agenda-files (file-expand-wildcards "~/org-tree/*.org"))
  (setq org-hide-emphasis-markers t))

(use-package nano-agenda)


(provide 'tealeg--org)

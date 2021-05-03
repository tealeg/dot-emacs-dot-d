;;; tealeg-selectrum  -- configure selectrum
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'selectrum)
(straight-use-package 'selectrum-prescient)
(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)
(provide 'tealeg-selectrum)
;;; tealeg-selectrum.el ends here

;;; tealeg-project --- Projectile configuration.
;;;
;;; Commentary:
;;;
;;; Code:

(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-file-exists-remote-cache-expire nil)
(setq projectile-switch-project-action 'projectile-dired)

(provide 'tealeg-project)
;;; tealeg-project.el ends here

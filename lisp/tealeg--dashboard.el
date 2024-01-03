
(use-package dashboard
  :elpaca t
  :demand t
  :hook ((elpaca-after-init-hook . dashboard-insert-startupify-lists)
	 (elpaca-after-init-hook . dashboard-initialize))
  :config
  (dashboard-setup-startup-hook)
  (dashboard-open))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(provide 'tealeg--dashboard)

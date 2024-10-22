(unless (eq system-type 'berkeley-unix)
  (use-package async)

  (use-package casual-dired
    :ensure (:host github
                   :repo "kickingvegas/casual-dired")
    :after async
    :init
    (require 'dired)
    (require 'dired-x)
    ;; (require 'clisp)
    (require 'wdired)
    (require 'image-dired)
    (require 'casual-dired)
    (when (eq system-type 'berkeley-unix)
      (setq dired-use-ls-dired nil))
    (when (eq system-type 'darwin)
      (setq dired-use-ls-dired nil))
    :bind (:map dired-mode-map (("C-o" . 'casual-dired-tmenu)
				("M-o" . 'dired-omit-mode)
				("E" . 'wdired-change-to-wdired-mode)
				("C-o" . 'casual-dired-tmenu)
				("s" . 'casual-dired-sort-by-tmenu)
				("M-n" . 'dired-next-dirline)
				("M-p" . 'dired-prev-dirline)
				("]" . 'dired-next-subdir)
				("[" . 'dired-prev-subdir)
				("A-M-<mouse-1>" . 'browse-url-of-dired-file))
		:map image-dired-thumbnail-mode-map (("n" . 'image-dired-display-next)
                                                     ("p" . 'image-dired-display-previous))


		)
    :config
    (add-hook 'dired-mode-hook 'hl-line-mode)
    (add-hook 'dired-mode-hook 'context-menu-mode)
    (add-hook 'dired-mode-hook 'dired-async-mode)
    (add-hook
     'dired-mode-hook
     (lambda ()
       (setq-local mouse-1-click-follows-link 'double)))
    ))

(provide 'tealeg--dired)

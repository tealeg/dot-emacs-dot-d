;; Get vc out of the way and let magit handle git
(setq vc-handled-backends (delq 'Git vc-handled-backends))

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

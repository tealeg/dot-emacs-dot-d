(setq lexical-binding 1)


;; (use-package mini-frame :ensure t)

(elpaca mini-frame)

(elpaca-wait)

(use-package nano-base-colors
  :ensure (:host "github.com" :repo "rougier/nano-emacs")
  :config
  ;; require mandatory files and whatever else is desired


  
  (require 'nano-base-colors)
  (require 'nano-faces)
  (require 'nano-theme)
  (require 'nano-splash)
  (require 'nano-theme-dark)
  (require 'nano-theme-light)
  (require 'nano-help)
  (require 'nano-modeline)
  (require 'nano-layout)
  (require 'nano-session)
  (require 'nano-defaults)
  (require 'nano-colors)

  (nano-theme-set-light)
  (setq nano-light-foreground nano-color-foreground)
  (setq nano-light-background nano-color-background)
  (setq nano-light-subtle nano-color-subtle)
  ;; (require 'nano-command)

  (if (string= system-type 'gnu/linux)
      (progn
        (setq nano-font-size 12)
        (menu-bar-mode -1))
    (progn
      (require 'nano-minibuffer)
      (setq nano-font-size 20)))

  (nano-faces)
  (nano-theme))
(provide 'tealeg--nano)

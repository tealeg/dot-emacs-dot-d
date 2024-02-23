(setq lexical-binding 1)


;; (use-package mini-frame :ensure t)

(elpaca mini-frame)

(elpaca-wait)

(use-package nano-base-colors
  :ensure (:host "github" :repo "rougier/nano-emacs")
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
  (require 'nano-minibuffer)
  (nano-theme-set-light)
  (setq nano-light-foreground nano-color-foreground)
  (setq nano-light-background nano-color-background)
  (setq nano-light-subtle nano-color-subtle)
  ;; (require 'nano-command)
  
  (setq nano-font-size 20)

  (nano-faces)
  (nano-theme))
(provide 'tealeg--nano)

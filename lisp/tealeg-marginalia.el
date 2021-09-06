(straight-use-package 'marginalia)
(straight-use-package 'savehist)




(savehist-mode 1)
(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))

(marginalia-mode 1)
(global-set-key (kbd "M-A") #'marginalia-cycle)
(define-key minibuffer-local-map (kbd "M-A") #'marginalia-cycle)
(define-key minibuffer-local-map (kbd "M-h") #'backward-kill-word)

(provide 'tealeg-marginalia)

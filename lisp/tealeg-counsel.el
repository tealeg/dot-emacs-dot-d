;;; tealeg-counsel -- setup for counsel / ivy
;;;
;;; Commentary:
;;;    Counsel / Ivy make major modifications to default interactions
;;;    with Emacs, this file captures my specific setup.
;;;
;;; Code:
(straight-use-package 'counsel)
(straight-use-package 'ivy-posframe)

(require 'ivy)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(require 'ivy-posframe)

(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(counsel-mode 1)
(ivy-posframe-mode 1)

(provide 'tealeg-counsel)
;;; tealeg-counsel.el ends here

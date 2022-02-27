;;; tealeg--minad.el -- experimenting with minad's extensions
;;;

;; Exeperimental minad tools ;-)


(straight-use-package 'corfu)
(straight-use-package 'vertico)
(straight-use-package 'marginalia)
(straight-use-package 'cape)

;; tempel
;; org-modern


(corfu-global-mode 1)
(vertico-mode 1)

(marginalia-mode 1)

(add-to-list 'completion-at-point-functions #'cape-file)

(provide 'tealeg--minad)
;;; tealeg--minad.el ends here

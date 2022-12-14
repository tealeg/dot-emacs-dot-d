(straight-use-package 'swiper)
(straight-use-package 'ivy)
(straight-use-package 'counsel)

(setq ivy-use-virtual-buffers t
      ivy-count-format "%d/%d ")

(ivy-mode 1)

(provide 'tealeg--counsel)

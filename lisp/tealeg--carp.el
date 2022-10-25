
(straight-use-package 'clojure-mode)
(add-to-list 'load-path "~/src/3rdparty/carp-emacs-master")

(require 'carp-mode)
(require 'inf-carp-mode)
(require 'carp-flycheck)

(add-hook 'carp-mode-hook
          (lambda ()
            (flycheck-mode 1)))


(add-to-list 'auto-mode-alist '("\\.carp" . carp-mode))


(provide 'tealeg--carp)

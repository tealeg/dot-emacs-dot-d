(add-to-list 'load-path "~/src/3rdparty/carp-emacs")

(straight-use-package 'clojure-mode)
(straight-use-package 'flycheck)
(require 'carp-mode)
(require 'inf-carp-mode)
(require 'flycheck)
(require 'carp-flycheck)


(setenv "CARP_DIR" (concat (getenv "HOME") "/src/3rdparty/Carp"))

(defun carp-mode-helper-f ()
  (flycheck-mode 1))

(add-hook 'carp-mode-hook #'carp-mode-helper-f)
	  
(add-to-list 'auto-mode-alist '("\\.carp\\'" . carp-mode))

(provide 'tealeg--carp)

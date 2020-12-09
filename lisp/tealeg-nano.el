(add-to-list 'load-path "~/src/3rdparty/nano-emacs/")

(setq package-user-dir "~/.emacs.d/packages")
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")))
(package-initialize)
(add-to-list 'load-path ".")

(set-face-font 'default "Share Tech Mono-18")
(require 'nano-layout)
(require 'nano-theme-dark)
;;(require 'nano-theme-light)
(require 'nano-modeline)
(require 'nano-help)
(require 'nano-splash)
(setf (alist-get 'font default-frame-alist) "Share Tech Mono:size=18")


(provide 'tealeg-nano)
;;; tealeg-nano.el ends here



;;; tealeg-carp --- configuration for the Carp language
;;;
;;; Commentary:
;;;   Load and configure Carp support
;;;
;;; Code:

(straight-use-package 'flycheck)
(straight-use-package 'clojure-mode)
(straight-use-package 'exec-path-from-shell)

(defvar carp-dir "~/src/3rdparty/Carp")
(defvar carp-emacs-dir "~/src/3rdparty/carp-emacs")

(defun carp-mode-helper-f ()
  (exec-path-from-shell-setenv "CARP_DIR" (expand-file-name carp-dir))
  (setq inf-carp-program "~/.local/bin/carp")
  (require 'flycheck)
  (show-paren-mode 1)
  (electric-pair-mode 1)
  (flycheck-mode 1))

(defun load-carp ()
  (add-to-list 'load-path carp-emacs-dir)
  (require 'carp-mode)
  (require 'carp-flycheck)
  (require 'inf-carp-mode)

  (add-hook 'carp-mode-hook 'carp-mode-helper-f)
  )

(if (file-exists-p carp-emacs-dir)
    (load-carp))
  

(provide 'tealeg-carp)
;;; tealeg-carp.el ends here

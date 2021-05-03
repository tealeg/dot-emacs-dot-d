;;; init.el -- the root of my emacs configuration
;;;
;;; Commentary:
;;;	Everything starts here! My intent is that this file should
;;;	contain as little as possible, hopefully just requiring a
;;;	series of more specific configuration files.
;;;
;;; Code:

;; We do this for performance reasons - I have many GB to spare,
;; we don't need to collect garbage so aggressively.
(setq gc-cons-threshold 120000000)

;;; Grab bigger blocks of data from processes, because LSP
;;; implementations sometimes give 3MB chunks back.
(setq read-process-output-max (* 1024 4096)) ;; 4mb

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'tealeg-package-management)
(require 'tealeg-custom-file)
(require 'tealeg-environment)
(require 'tealeg-text-encoding)
(require 'tealeg-backups)
(require 'tealeg-tree-sitter)
(require 'tealeg-lsp)
(require 'tealeg-go)
(require 'tealeg-vc)
(require 'tealeg-eshell)
(require 'tealeg-markdown)
(require 'tealeg-appearance)
(require 'tealeg-flycheck)
(require 'tealeg-comint)

(defun reload-theme (theme)
  "Reload a custom theme."
  (interactive
   (list
    (intern (completing-read "Reoad custom theme: "
                             (mapcar #'symbol-name
				     (custom-available-themes))))
    ))
  (unless (custom-theme-name-valid-p theme)
    (error "Invalid theme name `%s'" theme))
  (disable-theme theme)
  (load-theme theme))


(provide 'init)
;;; init.el ends here

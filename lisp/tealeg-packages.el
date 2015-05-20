;;; tealeg-packages --- my packages settings.
;;;
;;; Commentary:
;;;     Packages setup

;;; Code:
(require 'cl-lib)
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

(defvar tealeg/packages/depencies
  '(minimal-theme flycheck flycheck-pyflakes git-gutter go-mode org org-page column-enforce-mode powerline smartparens)
  "A list of package required for my Emacs setup.")

(defun tealeg/packages/installed-p ()
	"Return t if all required packages are installed."
  (cl-reduce (lambda (a b) (and a b))
	     (mapcar 'package-installed-p tealeg/packages/depencies)))

(defun tealeg/packages/install-dependencies ()
	"Install all package dependencies required by my configuration."
  (unless (tealeg/packages/installed-p)
    (message "%s" "Now refershing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (dolist (p tealeg/packages/depencies)
      (when (not (package-installed-p p))
	(package-install p)))))


 (tealeg/packages/install-dependencies)


(provide 'tealeg-packages)
;;; tealeg-packages.el ends here


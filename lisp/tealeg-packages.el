;;; tealeg-packages --- my packages settings.
;;;
;;; Commentary:
;;;     Packages setup

;;; Code:
(require 'cl-lib)
(require 'package)

(defvar tealeg/packages/depencies
  '(ample-theme
    column-enforce-mode
    challenger-deep-theme
    company
    exec-path-from-shell
    flycheck
    flycheck-pyflakes
    geiser
    git-gutter
    go-mode
    go-complete
    go-eldoc
    go-guru
    magit
    minimal-theme
    tao-theme
    org
    org-plus-contrib
    highlight-parentheses
    js2-mode
    ace-jump-mode
    web-mode
    paredit
    multi-web-mode
    auto-complete
    go-autocomplete
    projectile
    yasnippet
    rainbow-delimiters
    )
  "A list of package required for my Emacs setup.")

(when (eq system-type 'darwin)
  (dolist (package '(grab-mac-link launchctl spotlight))
    (add-to-list 'tealeg/packages/depencies package)))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)


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


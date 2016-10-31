;;; tealeg-go --- my go settings.
;;;
;;; Commentary:
;;;     Go setup

;;; Code:
(require 'go-mode)
(require 'go-complete)
(require 'go-eldoc)

(defvar go-oracle-path
  "/src/golang.org/x/tools/cmd/oracle/oracle.el"
  "Path below GOROOT or GOPATH where oracle.el lives.")

(defun load-from-go-path (sub-path)
  "Load an Emacs Lisp file from a Go directory, searching all possible locations for the SUB-PATH, starting with GOROOT and then iterating through the list of values for GOPATH."
  (let ((GOROOT (getenv "GOROOT"))
        (GOPATH (getenv "GOPATH")))
    (if (null GOPATH) (error "GOPATH not set"))
    (let ((go-load-path (if (null GOROOT) (split-string GOPATH ":")
                          (cons GOROOT (split-string GOPATH ";")))))
      (dolist (path go-load-path)
        (if (load (concat path sub-path) t)
            (return))
        (error (concat sub-path " not found below GOROOT or any GOPATH"))))))

(load-from-go-path go-oracle-path)

(setq gofmt-command "goimports")

(defun golang-helpers ()
  "Things to do when loading go-mode."
  (show-paren-mode 1)
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))

(defun golang-save-helpers ()
  "Things to do when saving a go file."
  (gofmt-before-save))

(add-hook 'go-mode-hook 'golang-helpers)
(add-hook 'before-save-hook 'golang-save-helpers)
(add-hook 'completion-at-point-functions 'go-complete-at-point)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(provide 'tealeg-go)
;;; tealeg-go.el ends here

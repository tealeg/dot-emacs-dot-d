;;; tealeg-go.el -- customisations for go programming
;;;
;;; Commentary:
;;;	This file has quite a lot of external dependencies, I'll
;;;	document how to install them as a I go:
;;;
;;;		go get golang.org/x/tools/cmd/goimports@latest
;;;             go get github.com/go-delve/delve@lateste
;;;             go get golang.org/x/tools/gopls@latest
;;;
;;; Code:

(straight-use-package 'lsp-mode)
(straight-use-package 'go-mode)
(straight-use-package 'gotest)
(straight-use-package 'go-dlv)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'yasnippet)
(require 'lsp-mode)
(require 'go-mode)
(require 'gotest)
(require 'cl-lib)
(require 'exec-path-from-shell)

(add-hook 'go-mode-hook 'lsp-deferred)

(custom-set-default 'lsp-clients-go-server "gopls")




(defun golang-save-helper ()
  "Things to do when saving a go file."
  (message gofmt-command)
  (gofmt-before-save))


(defun tealeg-go-mode-helper ()
  "Setup go-mode."
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GOROOT")
  (yas-minor-mode 1)
  (setq go-command
	(let ((go-paths (list "/usr/local/go/bin/go"
			      "/usr/local/bin/go"
			      "/snap/bin/go"
			      "/usr/bin/go")))
	  (cl-dolist (path go-paths)
	    (when (file-exists-p path)
	      (cl-return path)))))
  (define-key go-mode-map (kbd "C-c d") #'lsp-describe-thing-at-point)
  (define-key go-mode-map (kbd "C-l c") #'go-test-current-coverage)
  (define-key go-mode-map (kbd "C-l t o") #'go-test-current-test)
  (define-key go-mode-map (kbd "C-l t f") #'go-test-current-file)
  (define-key go-mode-map (kbd "C-l t p") #'go-test-current-project)
  (define-key go-mode-map (kbd "C-l b o") #'go-test-current-benchmark)
  (define-key go-mode-map (kbd "C-l b f") #'go-test-current-file-benchmarks)
  (define-key go-mode-map (kbd "C-l b p") #'go-test-current-project-benchmarks)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq go-test-verbose t)
  (setq go-test-args "-cover -race -cpu 2")
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'golang-save-helper t t)

  )



(add-hook 'go-mode-hook 'tealeg-go-mode-helper)


(provide 'tealeg-go)
;;; tealeg-go.el ends here

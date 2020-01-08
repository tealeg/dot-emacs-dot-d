;;; tealeg-go.el -- customisations for go programming
;;;
;;; Commentary:
;;;	This file has quite a lot of external dependencies, I'll
;;;	document how to install them as a I go.
;;;
;;; Code:

(straight-use-package 'lsp-mode)
(straight-use-package 'go-mode)
(straight-use-package 'gotest)
(straight-use-package 'go-dlv)
(require 'lsp-mode)
(require 'go-mode)
(require 'gotest)
(require 'cl-lib)


(add-hook 'go-mode-hook 'lsp)
(add-hook 'go-mode-hook 'flycheck-mode)

(custom-set-default 'lsp-clients-go-server "go-langserver")


(defun golang-save-helper ()
  "Things to do when saving a go file."
  (message gofmt-command)
  (gofmt-before-save))


(defun tealeg-go-mode-helper ()
  "Setup go-mode."
  (setq go-command
	(let ((go-paths (list "/usr/local/go/bin/go"
			      "/snap/bin/go"
			      "/usr/bin/go")))
	  (cl-dolist (path go-paths)
	    (when (file-exists-p path)
	      (cl-return path)))))
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



;;(straight-use-package 'go-test)
;;(straight-use-package 'yasnippet)

(provide 'tealeg-go)
;;; tealeg-go.el ends here

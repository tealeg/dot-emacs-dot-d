(with-eval-after-load 'go-mode
  (require 'go-complete)
  (require 'go-eldoc)
  (require 'go-guru)
  (require 'godoctor)
  (require 'which-func)
  (require 'yasnippet)
  (require 'flycheck)
  ;;(require 'rainbow-delimiters)
  (load-file "~/.emacs.d/avocet.elc")

  (setenv "GOROOT" "/usr/local/go")
  (setenv "GOPATH" (concat (getenv "HOME") "/go"))
  (add-to-list 'exec-path "~/go/bin")

  (add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))

  (setq gofmt-command "goimports")

  (setq mode-line-misc-info (delete (assoc 'which-func-mode
					   mode-line-misc-info) mode-line-misc-info)
	which-func-header-line-format '(which-func-mode ("" which-func-format)))

  (defadvice which-func-ff-hook (after header-line activate)
    (when which-func-mode
      (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                               mode-line-misc-info) mode-line-misc-info)
            header-line-format which-func-header-line-format)))

  (defun golang-helpers ()
    "Things to do when loading go-mode."
    (setq flycheck-disabled-checkers '(go-build))
    (yas-load-directory "~/.emacs.d/snippets/yasnippet-golang")  
    (yas-minor-mode 1)
    (electric-pair-mode 1)
    ;;(rainbow-delimiters-mode 1)
    (show-paren-mode 1)
    (go-eldoc-setup)
    (eldoc-mode 1)
    (go-guru-hl-identifier-mode 1)
    (which-function-mode 1)

    ;; Customize compile command to run go build
    (if (not (string-match "go" compile-command))
	(set (make-local-variable 'compile-command)
             "/usr/local/go/bin/go build -v && /usr/local/go/bin/go test -v && /usr/local/go/bin/go vet"))

    ;; Godef jump key binding
    (local-set-key (kbd "M-.") 'godef-jump)
    (local-set-key (kbd "M-*") 'pop-tag-mark)

    ;; avocet key bindings
    (local-set-key (kbd "C-l t o") 'avct/test-one)
    (local-set-key (kbd "C-l t p") 'avct/test-package)
    (local-set-key (kbd "C-l t a") 'avct/test-all)
    (local-set-key (kbd "C-l t r") 'avct/race-test-all))

  (defun golang-save-helpers ()
    "Things to do when saving a go file."
    (gofmt-before-save))

  (add-hook 'go-mode-hook 'golang-helpers)
  (add-hook 'before-save-hook 'golang-save-helpers)
  (add-hook 'completion-at-point-functions 'go-complete-at-point)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  )

;;; tealeg-go --- my go settings.
;;;
;;; Commentary:
;;;     Go setup

;;; Code:
(require 'go-mode)
(require 'go-complete)
(require 'go-eldoc)
(require 'exec-path-from-shell)
(require 'go-eldoc)
(require 'go-guru)
(require 'godoctor)
(require 'which-func)
(require 'yasnippet)
(require 'rainbow-delimiters)


(setenv "GOROOT" "/usr/local/go")
(setenv "GOPATH" (concat (getenv "HOME") "/go"))

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(add-to-list 'exec-path "~/go/bin")




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
  (yas-minor-mode 1)
  (electric-pair-mode 1)
  (rainbow-delimiters-mode 1)
  (yas-load-directory "~/.emacs.d/snippets/yasnippet-golang")
  (show-paren-mode 1)
  (go-eldoc-setup)
  (go-guru-hl-identifier-mode 1)
  (which-function-mode 1)

  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(defun golang-save-helpers ()
  "Things to do when saving a go file."
  (gofmt-before-save))

;; (with-eval-after-load 'go-mode
;;   (require 'go-autocomplete))

(add-hook 'go-mode-hook 'golang-helpers)
(add-hook 'before-save-hook 'golang-save-helpers)
(add-hook 'completion-at-point-functions 'go-complete-at-point)
(add-hook 'go-mode-hook 'go-eldoc-setup)


(provide 'tealeg-go)
;;; tealeg-go.el ends here

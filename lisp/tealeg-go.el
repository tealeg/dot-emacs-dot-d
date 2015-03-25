;;; tealeg-go --- my go settings.
;;;
;;; Commentary:
;;;     Go setup

;;; Code:
(require 'go-mode)

;; (load-file "/home/tealeg/go/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")

(setq gofmt-command "goimports")

(defun golang-helpers ()
  "Things to do when loading go-mode."
  (show-paren-mode 1)
  ;; Go oracle
  ;; (go-oracle-mode)
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

(provide 'tealeg-go)
;;; tealeg-go.el ends here

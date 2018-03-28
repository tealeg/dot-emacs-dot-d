(require 'eshell)

(setenv "GIT_PAGER" "")

;; Get branch name:

  (defun git-prompt-branch-name ()
    "Get current git branch name"
    (let ((args '("symbolic-ref" "HEAD" "--short")))
      (with-temp-buffer
        (apply #'process-file "git" nil (list t nil) nil args)
        (unless (bobp)
          (goto-char (point-min))
          (buffer-substring-no-properties (point) (line-end-position))))))

;; Custom prompt function:

  (defun tealeg:eshell-prompt ()
    (let ((branch-name (git-prompt-branch-name)))
      (concat
       "\n# " (user-login-name) " in " (abbreviate-file-name (eshell/pwd)) "\n"
       (if branch-name (format "git:(%s) >> " branch-name) ">> ")
       )))

;; Configure:

  (setq eshell-prompt-function #'tealeg:eshell-prompt
        eshell-prompt-regexp ".*>>+ ")



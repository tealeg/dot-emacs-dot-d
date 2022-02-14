;;; tealeg--package --- initialise package management.
;;;
;;; Commentary:
;;;     Setup straight.
;;;
;;; Code:

(require 'package)

(let ((guix-path "/home/tealeg/.guix-profile"))
  (if (file-exists-p guix-path)
      (setenv "PATH" (concat (getenv "PATH") ":" guix-path))))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; This block bootstraps straight:
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(straight-use-package 'melpa)

(provide 'tealeg--package)
;;; tealeg--package.el ends here.

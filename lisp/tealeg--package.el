;;; tealeg--package --- initialise package management.
;;;
;;; Commentary:
;;;     Setup straight.
;;;
;;; Code:

(require 'package)


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


;;; We'll use the MELPA package library.
(straight-use-package 'melpa)

(provide 'tealeg--package)
;;; tealeg--package.el ends here.


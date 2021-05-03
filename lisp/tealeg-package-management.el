;;; tealeg-package-management.el -- package management for Emacs
;;;
;;; Commentary:
;;;	My configuration is now using the "straight.el" functional
;;;	package management tool which wraps the default Emacs package
;;;	management tool, and adds in support for other sources of
;;;	packages and some robust bootstrapping mechanisms.  For more
;;;	info see:
;;;
;;;		https://github.com/raxod502/straight.el
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

(provide 'tealeg-package-management)
;;; tealeg-package-management.el ends here


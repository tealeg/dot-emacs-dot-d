;;; tealeg-lxd --- Interface to lxd.
;;;
;;; Commentary:
;;;
;;;    This package provides emacs with an interface to LXD base on the existing LXD client.
;;;    NOTE - it might be better to talk directly to LXD, we'll see.
;;;
;;; Code:

(require 'cl-lib)


(defun tealeg-lxd-start (name)
	"Start the container with the provided NAME."
	(shell-command (concat "lxc start " name)))

(defun tealeg-lxd-stop (name)
	"Stop the container with the provided NAME."
	(shell-command (concat "lxc stop " name)))


(defun tealeg-lxd-exec (name command &rest environment)
	"Execute, within the container with the provided NAME, a COMMAND.

Optionally a number of ENVIRONMENT variables can be passed in the form variable=value."
	(if (null environment)
			(shell-command-to-string (concat "lxc exec " name command))
		(shell-command-to-string
		 (concat "lxc exec " name
						 (mapconcat (lambda (e) (concat "--env " e)) environment " ")
						 command))))

(defun tealeg-lxd-launch (image name &optional ephemeral profile)
	"Launches a container using the specified IMAGE and NAME.

   If EPHEMERAL is passed with any value other that nil then the instance will be launched as an ephemeral instance.  If a PROFILE name is passed, then this named configuration profile will be applied to the instance."
	(let ((command (concat "lxc launch " image " " name)))
		(if (not (null ephemeral))
				(setq command (concat command " -e")))
		(if (not (null profile))
				(setq command (concat command " -p " profile)))
		(shell-command command)))


(defun tealeg-lxd-list (&rest filters)
	"List the available resources.

Optionally a nunber of FILTERS can be passed.  If a single keyword like 'web' is passed then any resource with 'web' in it's name will be listed.  If a filter with the form key=value is passed then resources with configuration values matching the key/value pair will be returned."
	(tealeg-table-to-alist
	 (if (null filters)
			 (shell-command-to-string "lxc list")
		 (shell-command-to-string (concat "lxd list " (mapconcat #'eval filters " "))))))


(defun tealeg-table-to-alist (table)
	"Convert TABLE text to a alist."
	(let* ((raw-rows (mapcar #'tealeg--split-line-into-fields
													 (tealeg--filter-horizontal-separators (tealeg--lines-to-list table))))
				 (headings (mapcar (lambda (n) (intern (concat ":" n))) (car raw-rows)))
				 (rows (cdr raw-rows))
				 result)
		(dolist (row (nreverse rows) result)
			(setq result (cons (cl-mapcar #'cons headings row) result)))))


(defun tealeg--lines-to-list (lines)
	"Split the LINES of tabular text input into a list of lines."
	(split-string lines "\n" t "[ \t]+"))


(defun tealeg--filter-horizontal-separators (lines)
	"Filter out any line in LINES containing only horizontal separator characters."
	(-filter (lambda (row)
						 (not (string-match-p "\\+?-*\\+" row)))
					 lines))

(defun tealeg--split-line-into-fields (line)
	"Return a list of the values in each column represented in LINE."
	(split-string (tealeg--separator-trim-left (tealeg--separator-trim-right line))
								"|"  nil "[ \t]+"))

(defun tealeg--separator-trim-right (line)
	"Trim the trailing separator from the LINE."
	 (if (string-match "|[ \t]*\\'" line)
      (replace-match "" t t line)
		 line))

(defun tealeg--separator-trim-left (line)
  "Trim the leading separator from the LINE."
  (if (string-match "\\`[ \t]*|" line)
      (replace-match "" t t line)
    line))



(provide 'tealeg-lxd)
;;; tealeg-lxd.el ends here

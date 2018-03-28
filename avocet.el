(require 'magit-git)

(defmacro avct/cmd-in-project-root (cmd)
  `(progn
       (let ((pwd default-directory)
             (root (avct/get-project-root)))
         (cd root)
         (let ((result ,cmd))
           (cd pwd)
           result))))

(defun avct/list-packages ()
  (interactive)
  (let ((output (avct/cmd-in-project-root (shell-command-to-string "/usr/local/go/bin/go list ./... "))))
    (split-string output)))

(defun avct/race-test-all ()
  (interactive)
  (let* ((pkgs (string-join (avct/list-packages) " "))
         (cmd (concat "/usr/local/go/bin/go test -v -cpu 2 -race " pkgs)))
    (avct/cmd-in-project-root (compile cmd))))

(defun avct/test-all ()
  (interactive)
  (let* ((pkgs (string-join (avct/list-packages) " "))
         (cmd (concat "/usr/local/go/bin/go test -v " pkgs)))
    (avct/cmd-in-project-root (compile cmd))))

(defun avct/get-project-root ()
  (magit-toplevel))

(defun avct/buffer-path-below-project-root ()
  (let ((root (avct/get-project-root))
        (full-path (expand-file-name (buffer-file-name))))
    (substring full-path (string-width root))))

(defun avct/get-current-test-func-name ()
  (save-excursion
    (if (not (null (re-search-backward "func.*\\(Test.*\\)(" nil t)))
        (match-string-no-properties 1))))

(defun avct/test-package ()
  (interactive)
  (avct/cmd-in-project-root
   (compile (concat "/usr/local/go/bin/go test -v ./" (file-name-directory (avct/buffer-path-below-project-root))))))

(defun avct/test-one ()
  (interactive)
  (let ((project-file-path (avct/buffer-path-below-project-root))
        (test-name (avct/get-current-test-func-name)))
    (let ((cmd (concat "/usr/local/go/bin/go test -v ./" (file-name-directory project-file-path) " -run " test-name)))
      (avct/cmd-in-project-root (compile cmd)))))

;;; tealeg-landscape --- Minor mode for working with landscape python files.
;;;
;;; Commentary:
;;;

;;; Code:

(setq lexical-binding t)
(require 'compile)
(require 'cl-lib)
(require 'esh-util)
(require 'esh-mode)
(require 'eshell)
(require 'ansi-color)

(defvar eshell-temp "temp")


(setq-default compilation-environment '("TERM=xterm-256color"))

(ignore-errors
  (require 'ansi-color)
  (defun ls-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
(add-hook 'compilation-filter-hook 'ls-colorize-compilation-buffer))


(defcustom ls-code-root
  (file-name-as-directory
   (concat (file-name-as-directory (getenv "HOME")) "src"))
  "The directory beneath which canonical code is checked out, typically' ~/src'."
  :group 'landscape)

(defcustom ls-lxc-container-name
	"l2"
	"Container name."
	:group 'landscape)

(defcustom ls-number-of-parallel-processes 4
  "The number of parallel processes to use for testing."
  :group 'landscape)

(defun ls-lxc-container-ip ()
	"Return the IP address of the lxc-container we use for testing."
	(shell-command-to-string (concat "lxc-ip " ls-lxc-container-name)))


(defmacro parent-dir (path)
  "Return the path of the parent directory of this PATH."
  `(file-name-directory (directory-file-name ,path)))


(defun ls-get-rootless-part (root path)
  "Subtract the ROOT path from the provided PATH."
  (let* ((root (file-name-as-directory (expand-file-name root)))
         (root-width (string-width root))
         (path (expand-file-name path)))
    (if (string-prefix-p root path)
        (substring path root-width)
      (error (concat "Current directory is not within your root: " path " (" root ")")))))


(defun ls-get-project-root ()
	"Get the root directory of the current project."
  (interactive)
  (let ((rootless-part (ls-get-rootless-part ls-code-root default-directory)))
    (file-name-as-directory
     (concat (file-name-as-directory ls-code-root)
             (substring rootless-part 0
                        (string-match (regexp-quote "/") rootless-part))))))


(defun ls-get-compilation-root ()
  "Based on the current buffer location, return the correct path to run compile tasks from."
  (interactive)
  (let* ((working-directory (expand-file-name default-directory))
         (project-root (ls-get-project-root))
         (project-root-width (string-width project-root))
         (project-name
          (substring working-directory project-root-width
                     (string-match (regexp-quote "/")
                                   working-directory
                                   (+ 1 project-root-width)))))
         (file-name-as-directory (concat project-root project-name))))


(defun ls-module-path (buffer-path)
	"Convert the provided BUFFER-PATH to a dot-seperated python module path."
  (interactive)
  (let ((compilation-root (ls-get-compilation-root)))
    (replace-regexp-in-string
     "\/" "\."
     (replace-regexp-in-string
      "\\(\.py\\|\.\\)$" ""
      (substring buffer-path (string-width compilation-root))))))

(defun ls-test-module-path (buffer-path)
	"Get the path of the test module associated with the module at BUFFER-PATH."
  (interactive)
  (let* ((compilation-root (ls-get-compilation-root))
         (module-path (substring buffer-path (string-width compilation-root)))
         (file-name (file-name-nondirectory module-path))
         (test-path (if (string-match-p "test_.*" file-name)
                        module-path
                      (concat (file-name-directory module-path) "tests/test_" file-name)))
				 )
    (replace-regexp-in-string
     "\/" "\."
     (replace-regexp-in-string "\\(\.py\\|\.\\)$" "" test-path))))

(defun ls-get-file-path-in-project ()
	"Get the path of the current buffer below the project root."
  (interactive)
  (let ((compilation-root (ls-get-compilation-root)))
     (substring (buffer-file-name (current-buffer)) (string-width compilation-root))))


(defun ls-get-unique-lineref ()
	"Generate a unique reference to the current line of code in the project."
  (let ((ref (concat (ls-get-file-path-in-project) " - Line "
                     (number-to-string (line-number-at-pos (mark))))))
    ref))

(defun ls-get-review-point ()
	"Generate a template for a review point on the current line of code."
  (interactive)
  (save-excursion
    (unless (use-region-p)
      (progn
        (move-beginning-of-line nil)
        (set-mark-command nil)
        (move-end-of-line nil)))
    (let ((lineref (ls-get-unique-lineref))
          (reference-text (buffer-substring (region-beginning) (region-end))))
      (kill-new (concat "[]\n" lineref "\n\n" reference-text))))
  (deactivate-mark))

(defmacro ls-def-action (name description command)
  "Define an action against a branch.  The action will be callable by NAME, have DESCRIPTION as it's docstring and will execute COMMAND."
  `(defun ,name ()
     ,description
     (interactive)
     (compile (concat "ssh " (getenv "USER") "@" (ls-lxc-container-ip) " "
                      "\". ~/.landscape-env && cd "
                      (save-excursion (ls-get-compilation-root))
                      " && " ,command "\"")
              t)))


(defun ls-branch-size ()
  "Show a message telling us the current size of the diff of this branch against trunk (in lines)."
  (interactive)
  (let ((lines (shell-command-to-string
                (concat "cd " (save-excursion (ls-get-compilation-root)) " && "
                        "bzr diff -r ancestor:../trunk | wc -l"))))
    (message (format "This branch makes a %s line diff!"
                     (replace-regexp-in-string "\n" "" lines)))))



(ls-def-action ls-build-devel
               "Build development environment"
               "unset GOROOT && unset GOPATH && make build-devel")

(ls-def-action ls-test
               "Complete test run"
               (concat "LANDSCAPE_TEST_RUNNER=trial ./bin/test -j" (number-to-string ls-number-of-parallel-processes)  " --tbformat=emacs canonical"))


(ls-def-action ls-lint
               "Make lint the current project."
               "make lint")

(ls-def-action ls-fresh-data
               "Make freshdata on the current project"
               "make freshdata")

(ls-def-action ls-droptestlayerdb
               "Make droptestlayerdb on current project."
               "make droptestlayerdb")

(ls-def-action ls-dropdb
               "Make dropdb on current project."
               "make dropdb")

(ls-def-action ls-go-fmt
               "Run go get for package search dependencies."
               "unset GOROOT && unset GOPATH && make go-fmt")


(ls-def-action ls-go-get
               "Run go get for package search dependencies."
               "unset GOROOT && unset GOPATH && make go-get")

(ls-def-action ls-go-test
               "Run go tests for package search."
               (concat "unset GOROOT && unset GOPATH && make go-test 2>&1 | sed -e 's/build\\/go\\/src\\/launchpad.net\\/landscape/" 
                       (replace-regexp-in-string "/" "\\/" (expand-file-name
                                                            (ls-get-compilation-root))
                                                 t t)
                       "/g'"))

(ls-def-action ls-go-build
               "Build go based package search binaries."
               (concat "unset GOROOT && unset GOPATH && make go-build | sed -e 's/build\\//"
                       (replace-regexp-in-string "/" "\\/"
                                                 (expand-file-name
                                                  (ls-get-compilation-root))
                                                 t t)
                       "/g'"))

(ls-def-action ls-go-test-traced
               "Run go tests for package search."
               (concat "strace 'make go-test' > trace" ))

(ls-def-action ls-selenium-test
               "Run selenium tests."
               "./bin/selenium-test")

(ls-def-action ls-js-test
               "Run javascript tests."
               "unset GOROOT && unset GOPATH && GROVER_OPTIONS=\"--console\" make js-test")

(ls-def-action ls-js-rebuild
               "Rebuild Javascript."
               "unset GOROOT && unset GOPATH && make js-rebuild")

(ls-def-action ls-css-rebuild
               "Rebuild CSS."
               "unset GOROOT && unset GOPATH && make css-rebuild")


(ls-def-action ls-test-module
               "Run tests from this module only."
               (concat "LANDSCAPE_TEST_RUNNER=trial ./bin/test  -j" (number-to-string ls-number-of-parallel-processes) " --tbformat=emacs  "
                       (save-excursion (ls-module-path (buffer-file-name (current-buffer))))))


(ls-def-action ls-test-package
               "Run test from this package only."
               (concat "LANDSCAPE_TEST_RUNNER=trial ./bin/test  -j" (number-to-string ls-number-of-parallel-processes) " --tbformat=emacs "
                       (save-excursion
                         (ls-module-path (parent-dir (buffer-file-name (current-buffer)))))))

(ls-def-action ls-test-one
               "Run just this test."
               (save-excursion
                 (if (re-search-backward "^    def \\(.*\\)(" (point-min) t)
                     (let ((method-name (match-string 1)))
                       (if (re-search-backward "^class \\(.*\\)(" (point-min)
                                               t)
                           (let ((class-name (match-string 1)))
                             (concat "LANDSCAPE_TEST_RUNNER=trial ./bin/test --tbformat=emacs "
                                     (ls-module-path (buffer-file-name (current-buffer)))
                                     "." class-name
                                     "." method-name))
                         (concat "trial " (ls-module-path (buffer-file-name (current-buffer)))
                                 "." method-name)))
                   (error "No method definition found"))))

(ls-def-action ls-selenium-test-one
               "Run just this selenium test."
               (save-excursion
                 (if (re-search-backward "^    def \\(.*\\)(" (point-min) t)
                     (let ((method-name (match-string 1)))
                       (if (re-search-backward "^class \\(.*\\)(" (point-min)
                                               t)
                           (let ((class-name (match-string 1)))
                             (concat "./bin/selenium-test "
                                     (ls-module-path (buffer-file-name (current-buffer)))
                                     "." class-name
                                     "." method-name))
                         (concat "trial " (ls-module-path (buffer-file-name (current-buffer)))
                                 "." method-name)))
                   (error "No method definition found"))))

(ls-def-action ls-trial
               "Run trial for landscape client"
               "trial landscape")

(ls-def-action ls-trial-module "Run trial on module"
  (concat "trial " (save-excursion (ls-module-path (buffer-file-name (current-buffer))))))

(ls-def-action ls-trial-package
               "Run trial for this package only."
               (concat
                "trial "
                (save-excursion
                  (ls-module-path (parent-dir (buffer-file-name (current-buffer)))))))

(ls-def-action ls-trial-one
               "Run just this test."
               (save-excursion
                 (if (re-search-backward "^    def \\(.*\\)(" (point-min) t)
                     (let ((method-name (match-string 1)))
                       (if (re-search-backward "^class \\(.*\\)(" (point-min)
                                               t)
                           (let ((class-name (match-string 1)))
                             (concat "trial  " (ls-module-path (buffer-file-name (current-buffer)))
                                     "." class-name
                                     "." method-name))
                         (concat "trial " (ls-module-path (buffer-file-name (current-buffer)))
                                 "." method-name)))
                   (error "No method definition found"))))

(ls-def-action ls-make-client-docs
               "Generate landscape client documentation for python code."
               "make doc")



(define-minor-mode landscape-maintainer-mode
  "Toggle Landscape Maintainer Mode.

A collection of convenience functions to aid in the maintenance of Landscape
code."
  :init-value nil
  :lighter " ls"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-l t o") 'ls-test-one)
            (define-key map (kbd "C-l t m") 'ls-test-module)
            (define-key map (kbd "C-l t p") 'ls-test-package)
            (define-key map (kbd "C-l t a") 'ls-test)
            map)
  :group 'landscape
  :global nil)

(define-minor-mode landscape-client-maintainer-mode
  "Toggle Landscape Client Maintainer Mode.

A collection of convenience functions to aid in the maintenance of Landscape
client code."
  :init-value nil
  :lighter " ls-c"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-l t o") 'ls-trial-one)
            (define-key map (kbd "C-l t m") 'ls-trial-module)
            (define-key map (kbd "C-l t p") 'ls-trial-package)
            (define-key map (kbd "C-l t a") 'ls-trial)
            map)
  :group 'landscape
  :global nil)

(defmacro ls-in-project-path-p (project)
  "The current buffer is within a branch belonging to the provided PROJECT."
  `(let ((project-path
	  (condition-case nil
	      (ls-get-project-root)
	    (error nil))))
     (message (concat "Project path: " project-path))
     (and project-path
	  (string-match-p ,(format ".*\/%s\/$" project) project-path))))


(defun ls-landscape-path-p ()
  "Return t if the current buffer is within a landscape branch."
  (ls-in-project-path-p "landscape"))

(defun ls-landscape-client-path-p ()
  "Return t if the current buffer is within a landscape-client branch."
  (ls-in-project-path-p "landscape-client"))

(defun ls-find-file-hook-f ()
  "Enable Landscape Maintainer Mode if that is appropriate."
    (cond ((ls-landscape-path-p)
           (landscape-maintainer-mode 1))
          ((ls-landscape-client-path-p)
           (landscape-client-maintainer-mode 1))))

(defun ls-mode-autohook ()
  "Automatically enable Landscape Maintainer Mode on files in the Landscape source tree."
  (add-hook 'find-file-hook 'ls-find-file-hook-f))

(add-to-list 'auto-mode-alist '("\\.zcml\\'" . xml-mode))


(ls-mode-autohook)
(provide 'tealeg-landscape)
;;; tealeg-landscape.el ends here

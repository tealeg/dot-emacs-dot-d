;;; tealeg-org.el  --- Custom org setup for producing www.teale.de.
;;;
;;; Commentary:
;;;		This file sets up org-mode and org-page ot publish www.teale.de.
;;;
;;; Code:

(require 'org)
(require 'org-page)
(require 'auth-source)

(setq op/repository-directory "/home/tealeg/org")
(setq op/site-domain "http://www.teale.de")
(let ((secret (plist-get (car (auth-source-search :host "www.disqus.com")) :secret)))
	(setq op/personal-disqus-shortname (funcall secret)))
(setq op/site-main-title "Geoffrey J. Teale")
(setq op/site-sub-title "Tealeg's mind welcomes careful drivers...")
(setq op/personal-github-link "https://github.com/tealeg")
(setq op/theme-root-directory "/home/tealeg/op-themes/")
(setq op/theme 'tealeg)
(let ((secret (plist-get (car (auth-source-search :host "analytics.google.com")) :secret)))
	(setq op/personal-google-analytics-id (funcall secret)))
(setq op/personal-avatar nil)


;; I have to override this, because of localisation of the message it checks -
;; D'oh!
(defun op/git-init-repo (repo-dir)
  "This function will initialize a new empty git repository.  REPO-DIR is the directory where repository will be initialized."
  (unless (file-directory-p repo-dir)
    (mkdir repo-dir t))
	(let ((result (op/shell-command repo-dir "git init" nil)))
		(unless (or (string-prefix-p "Initialised empty Git repository" result)
								(string-prefix-p "Initialized empty Git repository" result))
			(error "Fatal: Failed to initialise new git repository '%s'" repo-dir))))

(define-key org-mode-map "\"" #'endless/round-quotes)

(defun endless/round-quotes (italicize)
  "Insert “” and leave point in the middle.
With prefix argument ITALICIZE, insert /“”/ instead
\(meant for org-mode).
Inside a code-block, just call `self-insert-command'."
  (interactive "P")
  (if (and (derived-mode-p 'org-mode)
           (org-in-block-p '("src" "latex" "html")))
      (call-interactively #'self-insert-command)
    (if (looking-at "”[/=_\\*]?")
        (goto-char (match-end 0))
      (when italicize
				(insert "//")
        (forward-char -1))
      (insert "“”")
      (forward-char -1))))

(define-key org-mode-map "'" #'endless/apostrophe)

(defun endless/apostrophe (opening)
  "Insert ’ in prose or `self-insert-command' in code.
With prefix argument OPENING, insert ‘’ instead and
leave point in the middle.
Inside a code-block, just call `self-insert-command'."
  (interactive "P")
  (if (and (derived-mode-p 'org-mode)
           (org-in-block-p '("src" "latex" "html")))
      (call-interactively #'self-insert-command)
    (if (looking-at "['’][=_/\\*]?")
        (goto-char (match-end 0))
      (if (null opening)
          (insert "’")
        (insert "‘’")
        (forward-char -1)))))

(defun publish-website ()
	"Automate the steps for publishing a new version of www.teale.de."
	(interactive)
	(let ((tempdir (make-temp-file "teale-de" t)))
		(op/do-publication t nil tempdir)
		(compile (concat "rsync -avz " tempdir "/* www.teale.de:/var/www/ && scp " tempdir "rss.xml www.teale.de:/var/www/rss.xml"))))


(defun publish-css ()
	"Automate the steps for publishing a new css on www.teale.de."
	(interactive)
	(let ((tempdir (make-temp-file "teale-de" t)))
		(op/do-publication t nil tempdir)
		(compile (concat "scp -r " tempdir "/media/css/* www.teale.de:/var/www/media/css/"))))

(require 'ox-latex)
(setq org-export-latex-listings t)

(add-to-list 'org-latex-classes
             '("elsarticle"
               "\\documentclass{elsarticle}
                 [NO-DEFAULT-PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("tufte-book"
               "\\documentclass{tufte-book}
                 [NO-DEFAULT-PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("tufte-handout"
               "\\documentclass{tufte-handout}
                 [NO-DEFAULT-PACKAGES]
                 [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(provide 'tealeg-org)
;;; tealeg-org.el ends here

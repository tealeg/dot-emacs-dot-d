;; (add-to-list 'default-frame-alist '(fullscreen . maximized)) ;; Maximize window after starting Emacs
(setq inhibit-startup-message t) ;; Close Emacs launch screen
(setq inhibit-splash-screen t)   ;; Close Emacs startup help screen
(setq initial-scratch-message (concat ";; Happy hacking, " user-login-name " - Emacs \u2665 you!\n\n"))
;; Show your last execute command
(setq frame-title-format
      '(:eval (format "Emacs - %s  [ %s ]"
                      (buffer-name)
                      last-command))
      icon-title-format t)

;; (menu-bar-mode 0) ;; Emacs Text Toolbar above
(tool-bar-mode 0) ;; Close Emacs icon toolbar above
(scroll-bar-mode 0) ;; Close scrollbar
(set-fringe-mode 10) ;; increase fringe width
(show-paren-mode t)
(setq-default fringes-outside-margins nil)
(setq-default indicate-buffer-boundaries nil)
(setq-default indicate-empty-lines nil)
(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(setq ring-bell-function 'ignore) ;; Close Emacs warning sound

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(require 'ansi-color)
(require 'compile)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)


;; File related: Backup, Delete Recycle Bin
(setq make-backup-files nil        ;; Close the backup file
      create-lockfiles nil         ;; Close Create a backup file
      delete-by-moving-to-trash t) ;; Emacs moves to the recycling bin when deleting files

;; (load-theme 'modus-operandi-tinted t nil)

(use-package the-matrix-theme
  :ensure t
  :config (load-theme 'the-matrix t nil))

(use-package unicode-fonts
  :ensure t
  :config
  (unicode-fonts-setup))

(set-frame-font "IBM Plex Mono-17:weight=Thin")
 
(set-face-font 'default "IBM Plex Mono-17:weight=Thin")
(set-face-font 'fixed-pitch "IBM Plex Mono-17:weight=Thin")
(set-face-font 'fixed-pitch-serif "IBM Plex Mono-17:weight=Thin")
(set-face-font 'variable-pitch "IBM Plex Sans-17:weight=Thin")
(set-face-font 'variable-pitch-text "IBM Plex Serif-17:weight=Thin")
(set-face-font 'font-lock-comment-face "IBM Plex Serif-17:weight=Thin:slant=italic") ;; hello world



(if (eq system-type 'darwin)
    (setq mail-host-address "upvest.co"
	  user-mail-address "geoffrey@upvest.co")
  (setq mail-host-address "teale.de"
	user-mail-address "geoffrey@teale.de"))

(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier nil))
(if (eq system-type 'haiku)
    (progn
      (add-to-list 'load-path "~/config/settings/emacs/lisp")
      (setq custom-file "~/config/settings/emacs/custom.el"))
  (progn
    (add-to-list 'load-path "~/.config/emacs/lisp")
    (setq custom-file "~/.config/emacs/custom.el")))


(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Sometimes you want to keep the package available, so that it can be fixed in a certain version forever.
;; (setq  package-archives '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/melpa/");; 2025-02-25 8:00
;;                           ("gnu" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/gnu/");; 2025-07-25 8:00
;;                           ("org" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/org/");; 2025-07-25 8:00
;;                           ("nongnu" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/5a83cbae8df2c23a24b1509bfe808f6a89e5a645/nongnu/");; 2025-07-25 8:00
;;                           ))

;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(when (eq system-type 'darwin)
  (require 'info)
  (setopt Info-additional-directory-list (list "/opt/homebrew/share/info")))


(use-package gcmh
  :ensure t
  :init
  (gcmh-mode 1))

(use-package flyspell
  :ensure t
  :config
  (require 'ispell)
  (unless (eq system-type 'berkeley-unix)
    (setq ispell-dictionary "en_GB")))

(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode)
  :bind (:map vertico-map
              ("DEL" . vertico-directory-delete-char))
  :custom
  (vertico-count 10)
  )

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Display information in Minibuffer
(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

;; modelline display time
(use-package time
  :ensure nil
  :hook (after-init . display-time-mode)
  :custom
  (display-time-24hr-format t);; 24-hour system
  (display-time-format "%m-%d %a %H:%M")
  (display-time-day-and-date t) ;; Show time, day, date
  )

;; Automatically update files after external changes
(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

;; Where the cursor is located before saving each file
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode)
  :custom
  (save-place-file "~/.emacs.d/places"))

(use-package which-key
  :ensure nil
  :if (>= emacs-major-version 30)
  :diminish
  :hook (window-setup . which-key-mode))

(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-filename-handlers '(abbreviate-file-name))
  (recentf-max-saved-items 400)
  (recentf-max-menu-items 400)
  (recentf-save-file "~/.emacs.d/recentf")
  :config
  (recentf-cleanup))

(use-package project
  :ensure nil)

(use-package deadgrep
  :ensure t
  :bind
  (([remap project-find-regexp] . deadgrep)))

;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(when (eq system-type 'darwin)
  (require 'info)
  (setopt Info-additional-directory-list (list "/opt/homebrew/share/info")))


(use-package consult
  :ensure t
  :bind
  (([remap imenu] . consult-imenu)
   ([remap switch-to-buffer] . consult-buffer)
   ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
   ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
   ("M-g M-g" . consult-line)
   ("M-g g" . consult-goto-line)
   ([remap bookmark-jump] . freedom/consult-bookmark)
   ([remap repeat-complex-command] . consult-complex-command)
   ([remap yank-pop] . consult-yank-pop)
   ([remap Info-search] . consult-info)
   ("C-c cf" . consult-recent-file)
   ("C-c cF" . consult-flymake)
   ("C-c cg" . consult-grep)
   ("C-c cG" . consult-line-multi)
   ("C-c ck" . consult-kmacro)
   ("C-c cl" . consult-locate)
   ("C-c co" . consult-outline)
   ("C-c cr" . consult-ripgrep)
   :map isearch-mode-map
   ("C-c h" . consult-isearch-history)
   :map minibuffer-local-map
   ("C-c h" . consult-history)
   :map org-mode-map
   ([remap imenu] . consult-outline))
  :custom
  (register-preview-delay 0.5)
  (register-preview-function #'consult-register-format)
  (xref-search-program 'ripgrep)
  (xref-show-xrefs-function #'consult-xref)
  (xref-show-definitions-function #'consult-xref)
  (consult-preview-key 'any) ;; Preview content, can be set to buttons
  (consult-async-refresh-delay 1.0) ;; Prevent Emacs from being stuck by using external programs, for example: consult-ripgrep
  (consult-async-min-input 2) ;; Start searching at the minimum number of characters
  (consult-narrow-key "?") ;; Optional module buttons
  :config

  ;; Support Windows system `everythine.exe` software search file to use `conslut-locate`
  (when (and (eq system-type 'windows-nt))
    (setq consult-locate-args (encode-coding-string "es.exe -i -p -r" 'gbk)))

  ;; Disable preview of certain features
  (defmacro +no-consult-preview (&rest cmds)
    `(consult-customize ,@cmds :preview-key "M-."))
  (+no-consult-preview
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file
   consult--source-recent-file consult--source-project-recent-file consult--source-bookmark)
  )

(use-package eglot
  :ensure nil
  :if (>= emacs-major-version 29)
  :hook
  (eglot-managed-mode . (lambda () (eglot-inlay-hints-mode -1)));; No prompt is displayed
  :hook
  ;; NOTE: Please add your programming language here
  ((c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode) . eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c la" . eglot-code-actions) ;; Automatically write/repair code.
              ("C-c lr" . eglot-rename)
              ("C-c lf" . eglot-format) ;; Format current buffer
              ("C-c lc" . eglot-reconnect)
              ("C-c ld" . eldoc)) ;; view document
  :custom
  (eglot-autoshutdown t) ;; Automatically stop after closing all projects buffer
  (eglot-report-progress nil);; Hide all eglot event buffers
  :config
  (setq eglot-stay-out-of '(company));; No other complementary backend options are changed
  )

(defun freedom/compile-commands-json ()
  "Generate compile_commands.json for all .c/.C files in the selected directory.
Includes all directories containing .h/.H files as -I include paths."
  (interactive)
  (let* ((root (read-directory-name "Select project root: "))
         (c-files (directory-files-recursively root "\\.\\(c\\|C\\)$"))
         (h-dirs (let ((hs (directory-files-recursively root "\\.\\(h\\|H\\)$"))
                       (dirs '()))
                   (dolist (h hs)
                     (let ((dir (file-relative-name (file-name-directory h) root)))
                       (unless (member dir dirs)
                         (push dir dirs))))
                   dirs))
         (json-file (expand-file-name "compile_commands.json" root))
         (command-entries '()))

    ;; Construct the compile_commands.json project for each c file
    (dolist (c-file c-files)
      (let* ((rel-file (file-relative-name c-file root))
             (obj-file (concat (file-name-sans-extension rel-file) ".o"))
             (args (append
                    '("gcc" "-o")
                    (list obj-file "-g")
                    (mapcar (lambda (dir) (concat "-I" dir)) h-dirs)
                    (list rel-file)))
             (entry `(("directory" . ,(expand-file-name root))
                      ("arguments" . ,args)
                      ("file" . ,rel-file))))
        (push entry command-entries)))

    ;; Write JSON to compile_commands.json file
    (with-temp-file json-file
      (insert (json-encode command-entries)))
    (message "compile_commands.json generated at: %s" json-file)))

(use-package org
  :ensure nil
 :init
  (require 'org-agenda)
  (require 'org-habit)
  (require 'ox-md)
  (require 'org-indent)
  :config

  (setq
   org-adapt-indentation t
   org-agenda-files '("todo.org" "habits.org" "archive.org")
   org-agenda-tags-column 0
   org-auto-align-tags t
   org-catch-invisible-edits 'show-and-error
   org-edit-src-content-indentation 0
   org-ellipsis "…"
   org-fold-catch-invisible-edits 'show-and-error
   org-hide-emphasis-markers nil
   org-hide-leading-stars nil
   org-insert-heading-respect-content t
   org-log-done 'time
   org-log-into-drawer t
   org-pretty-entities t
   org-special-ctrl-a/e t
   org-src-fontify-natively t
   org-src-tab-acts-natively t
   org-tags-column -80
   org-todo-keywords (list "BLOCKED" "TODO" "IN-PROGRESS" "|" "DONE" "CANCELED" "DELEGATED"))
  (add-to-list 'org-agenda-custom-commands '("c" . "Closed"))
  (add-to-list 'org-agenda-custom-commands '("c1" tags "TODO=\"DONE\"&CLOSED>=\"<-1d>\""))
  (add-to-list 'org-agenda-custom-commands '("c2" tags "TODO=\"DONE\"&CLOSED>=\"<-2d>\""))
  (add-to-list 'org-agenda-custom-commands '("cw" tags "TODO=\"DONE\"&CLOSED>=\"<-1w>\""))
  (add-to-list 'org-agenda-custom-commands '("cm" tags "TODO=\"DONE\"&CLOSED>=\"<-1m>\""))
  (add-to-list 'org-agenda-custom-commands '("cy" tags "TODO=\"DONE\"&CLOSED>=\"<-1y>\""))

  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (defun tealeg--org-mode-helper-f ()
    (flyspell-mode 1)
    (variable-pitch-mode 1)
    (electric-indent-local-mode -1)
    (org-indent-mode 1)
    (set-face-font 'org-table "IBM Plex Mono" nil)
    )
  
  (add-hook 'org-mode-hook #'tealeg--org-mode-helper-f)


  (defun tealeg--is-file-modified (fname)
    (when (magit-run-git "status" "--porcelain" fname)
      (string-prefix-p "M" (string-trim
			    (save-excursion
			      (with-current-buffer (magit-process-buffer)
				(end-of-buffer)
				(set-mark (point-max))
				(beginning-of-line)
				(while (and (not (string-prefix-p "  0" (buffer-substring (point) (mark))))
					    (not (= (point) (point-min))))
				  (previous-line))
				(if (string-prefix-p "  0" (buffer-substring (point) (mark)))
				    (progn
				      (next-line)
				      (beginning-of-line)
				      (set-mark (point))
				      (end-of-line)
				      (buffer-substring (mark) (point)))
				  "")))))))
  
  

  (defun tealeg--org-commit-and-push-todos ()
    (interactive)
    (require 'magit)
    (require 'magit-process)

    (let ((modified nil))
      (dolist (fname org-agenda-files modified)
	(save-buffer (get-buffer fname))
	(magit-run-git "add" fname)
      ;; 	(when (tealeg--is-file-modified fname)
	(setq modified t)))
      ;; (when modified
    (magit-run-git "commit" "-m" (concat "'Update TODOs " (current-time-string) "'"))
    (magit-run-git-with-editor "pull" "-r" "origin" "main")
    (magit-run-git "push" "origin" "main")) ;; ))
  
  (defun tealeg--todo-save-helper-f ()
    (interactive)
    (let ((bname (buffer-file-name (current-buffer)))
	  (res nil))
      (when (dolist (aname org-agenda-files res)
	      (setq res (or res (string-suffix-p aname bname))))
	(tealeg--org-commit-and-push-todos))))

  (add-hook 'after-save-hook #'tealeg--todo-save-helper-f)

  )

(use-package corfu
  :ensure t
  :custom
  ;; Make the popup appear quicker
  (corfu-popupinfo-delay '(0.5 . 0.5))
  ;; Always have the same width
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  (corfu-count 14)
  (corfu-scroll-margin 4)
  ;; Have Corfu wrap around when going up
  (corfu-cycle t)
  (corfu-preselect-first t)
  :bind (:map corfu-map
              ;; Match `corfu-quick-complete' keybinding to `avy-goto-line'
              ("M-j" . corfu-quick-complete))
  :init
  ;; Enable Corfu
  (global-corfu-mode t)
  ;; Enable Corfu history mode to act like `prescient'
  (corfu-history-mode t)
  ;; Allow Corfu to show help text next to suggested completion
  (corfu-popupinfo-mode t))


(use-package cape
  :demand t
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (setq-default completion-at-point-functions
                (append (default-value 'completion-at-point-functions)
                        (list #'cape-dabbrev #'cape-file #'cape-abbrev))))

(use-package hydra
  :ensure t
  :init
(defhydra my/cape
  (:color blue :hint nil)
  "
^Complete^
^--------^
_i_ Completion at Point
_d_abbrev
_f_ile
_h_istory
_p_complete
_e_moji
"
  ("i" completion-at-point)
  ("p" (lambda () (interactive) (let ((completion-at-point-functions '(pcomplete-completions-at-point t))) (completion-at-point))))
  ("d" cape-dabbrev)
  ("f" cape-file)
  ("h" cape-history)
  ("e" cape-emoji)))



(use-package em-cmpl
  :ensure nil
  :config
  (bind-key "C-M-i" nil eshell-cmpl-mode-map)
  (defun my/em-cmpl-mode-hook ()
    (setq completion-at-point-functions
          (list #'cape-history #'cape-file #'cape-dabbrev)))
  (add-hook 'eshell-cmpl-mode-hook #'my/em-cmpl-mode-hook))


(use-package completion-preview
  :ensure nil
  :bind (:map completion-preview-active-mode-map
              ("M-f" . #'completion-preview-insert-word)
              ("C-M-f" . #'completion-preview-insert-sexp))
  :custom
  (completion-preview-minimum-symbol-length 2)
  :init
  (global-completion-preview-mode))


(bind-key "M-+" 'text-scale-increase)
(bind-key "M--" 'text-scale-decrease)


(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu))
  ;; :config
  :custom
  (aidermacs-default-chat-mode 'architect)
  (aidermacs-default-model "github_copilot/gpt-4.1"))

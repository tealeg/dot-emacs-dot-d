;;; tealeg--appearance --- Look and feel of emacs
;;;
;;; Commentary:
;;;     Make it puuuurdy
;;;
;;; Code:

(use-package fancy-battery
  :ensure t
  :init
  (add-hook 'after-init-hook #'fancy-battery-mode)
  (display-battery-mode -1))

(use-package ns-auto-titlebar
  :config
  (ns-auto-titlebar-mode 1))
  ;; )


(use-package modus-themes 
  :config
  (load-theme 'modus-operandi 't nil)

  (set-face-background 'minibuffer-prompt "White" nil)
  (require 'disp-table)

  (modify-all-frames-parameters
        (append (list
	             '(min-height . 1)
                 '(height     . 30)
	             '(min-width  . 1)
                 '(width      . 81)
                 '(vertical-scroll-bars . nil)
                 '(internal-border-width . 24)
                 '(left-fringe    . 1)
                 '(right-fringe   . 1)
                 '(tool-bar-lines . 0)
                 '(undecorated-round . 41))))

  
    ;; No startup  screen
  (setq inhibit-startup-screen t)

  ;; No startup message
  (setq inhibit-startup-message t)
  (setq inhibit-startup-echo-area-message t)
 

  ;; No message in scratch buffer
  (setq initial-scratch-message nil)

  ;; Initial buffer
  (setq initial-buffer-choice nil)

  ;; No frame title
  ;; (setq frame-title-format nil)

  ;; No file dialog
  (setq use-file-dialog nil)

  ;; No dialog box
  (setq use-dialog-box nil)

  ;; No popup windows
  (setq pop-up-windows nil)

  ;; No empty line indicators
  (setq indicate-empty-lines nil)

  ;; No cursor in inactive windows
  (setq cursor-in-non-selected-windows nil)

  ;; Text mode is initial mode
  (setq initial-major-mode 'text-mode)

  ;; Moderate font lock
  (setq font-lock-maximum-decoration nil)

  ;; No line break space points
  (setq auto-fill-mode nil)

  ;; Fill column at 80
  (setq fill-column 80)

  ;; show column number
  (setq column-number-mode 1)
  
  ;; No confirmation for visiting non-existent files
  (setq confirm-nonexistent-file-or-buffer nil)

  ;; Completion style, see
  ;; gnu.org/software/emacs/manual/html_node/emacs/Completion-Styles.html
  (setq completion-styles '(basic substring))

  ;; Use RET to open org-mode links, including those in quick-help.org
  (setq org-return-follows-link t)

  ;; Mouse active in terminal
  (unless (display-graphic-p)
    (xterm-mouse-mode 1)
    (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
    (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

  ;; No scroll bars
  (if (fboundp 'scroll-bar-mode) (set-scroll-bar-mode nil))

  ;; No toolbar
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

  ;; No menu bar
  (if (and (display-graphic-p) (eq system-type 'darwin))
      (menu-bar-mode t) ;; When nil, focus problem on OSX
    (menu-bar-mode -1))

  (when (eq system-type 'darwin)
    (setq ns-use-native-fullscreen t
          mac-option-key-is-meta nil
          mac-command-key-is-meta t
          mac-command-modifier 'meta
          mac-option-modifier nil
          mac-use-title-bar nil))

  ;; Make sure clipboard works properly in tty mode on OSX
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))
  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
	    (process-send-string proc text)
	    (process-send-eof proc))))
  (when (and (not (display-graphic-p))
             (eq system-type 'darwin))
    (setq interprogram-cut-function 'paste-to-osx)
    (setq interprogram-paste-function 'copy-from-osx))

  ;; y/n for  answering yes/no questions
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; No tabs
  (setq-default indent-tabs-mode nil)

  ;; Tab.space equivalence
  (setq-default tab-width 4)

  ;; Size of temporary buffers
  (temp-buffer-resize-mode)
  (setq temp-buffer-max-height 8)

  ;; Minimum window height
  (setq window-min-height 1)

  ;; Buffer encoding
  (prefer-coding-system       'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-language-environment   'utf-8)

  ;; Unique buffer names
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'reverse
        uniquify-separator " • "
        uniquify-after-kill-buffer-p t
        uniquify-ignore-buffers-re "^\\*")

  ;; Default shell in term
  (unless
      (or (eq system-type 'windows-nt)
          (not (file-exists-p "/bin/zsh")))
    (setq-default shell-file-name "/bin/zsh")
    (setq explicit-shell-file-name "/bin/zsh"))

  ;; Kill term buffer when exiting
  (defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
    (if (memq (process-status proc) '(signal exit))
        (let ((buffer (process-buffer proc)))
          ad-do-it
          (kill-buffer buffer))
      ad-do-it))
  (ad-activate 'term-sentinel)

  ;; Vertical window divider
  (setq window-divider-default-right-width 24)
  (setq window-divider-default-places 'right-only)
  (window-divider-mode 1)

  ;; No ugly button for checkboxes
  (setq widget-image-enable nil)

  ;; Fall back font for glyph missing in some fonts
  (defface fallback '((t :family "Fira Code"
                         :inherit 'nano-face-faded
                         )) "Fallback" :group 'basic-faces)
  (set-display-table-slot standard-display-table 'truncation
                          (make-glyph-code ?… 'fallback))
  (set-display-table-slot standard-display-table 'wrap
                          (make-glyph-code ?↩ 'fallback))
  
  (if (eq system-type 'darwin)
      (progn
        (set-face-font 'default "PT Mono-18")
        (set-face-font 'variable-pitch "PT Sans-18")
        (set-face-bold 'default nil)
        (set-face-italic 'default nil)
        (set-face-font 'font-lock-comment-face "PT Serif-18")
        (set-face-italic 'font-lock-comment-face t)
        (setf line-spacing 0.1))

        
        ;; (set-face-font 'default "InconsolataN-24")
        ;; (set-face-font 'variable-pitch "Linux Libertine O-24")
        ;; (set-face-bold 'default nil)
        ;; (set-face-italic 'default nil)
        ;; (set-face-font 'font-lock-comment-face "Linux Libertine O-24")
        ;; (set-face-italic 'font-lock-comment-face t)
        ;; (setf line-spacing 0.1))

        ;; (set-face-font 'default "CMU Typewriter Text-24")
        ;; (set-face-font 'variable-pitch "CMU Serif-24")
        ;; (set-face-font 'default "CMU Typewriter Text-24")
        ;; (set-face-bold 'default nil)
        ;; (set-face-italic 'default nil)
        ;; (set-face-font 'font-lock-comment-face "CMU Serif-24")
        ;; (set-face-italic 'font-lock-comment-face t)
        ;; (setf line-spacing 0.1))
    (progn
      (set-face-font 'default "IBM Plex Mono-12")
      (set-frame-font "IBM Plex Mono-12"))))
  
(provide 'tealeg--appearance)
;;; tealeg--appearance.el ends here


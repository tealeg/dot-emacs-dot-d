;;; tealeg-rust.el - configure support for rust
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'rustic)
(straight-use-package 'flycheck)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'company)
(straight-use-package 'lsp-treemacs)
(straight-use-package 'projectile)
(straight-use-package 'yasnippet)


(require 'lsp)
(require 'lsp-ui)
(require 'lsp-ui-imenu)
(require 'rustic)
(require 'yasnippet)
(require 'company)

(setq lsp-rust-analyzer-cargo-watch-command "clippy"
      lsp-eldoc-render-all t
      lsp-idle-delay 0.6
      lsp-rust-analyzer-server-display-inlay-hints t
      lsp-ui-peek-always-show t
      lsp-ui-sideline-show-hover t
      lsp-ui-doc-enable nil
      company-idle-delay 0.5
      lsp-rust-server "rust-analyzer" 
      )
(yas-reload-all)

(defun tealeg/rustic-mode-helper-f ()
  (company-mode 1)
  (setq-local buffer-save-without-query t)
  (define-key rustic-mode-map (kbd "M-j") #'lsp-ui-imenu)
  (define-key rustic-mode-map (kbd "M-?")  #'lsp-find-references)
  (define-key rustic-mode-map (kbd "C-c C-c l")  #'flycheck-list-errors)
  (define-key rustic-mode-map (kbd "C-c C-c a")  #'lsp-execute-code-action)
  (define-key rustic-mode-map (kbd "C-c C-c r")  #'lsp-rename)
  (define-key rustic-mode-map (kbd "C-c C-c q")  #'lsp-workspace-restart)
  (define-key rustic-mode-map (kbd "C-c C-c Q")  #'lsp-workspace-shutdown)
  (define-key rustic-mode-map (kbd "C-c C-c s")  #'lsp-rust-analyzer-status)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-<") #'company-select-first)
  (define-key company-active-map (kbd "M->") #'company-select-last)
  (define-key company-mode-map (kbd "TAB") #'tab-indent-or-complete)
  )

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(setq rustic-format-on-save t)
(add-hook 'rustic-mode-hook 'tealeg/rustic-mode-helper-f)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'yas-minor-mode)

(provide 'tealeg-rust)
;;; tealeg-rust.el ends here

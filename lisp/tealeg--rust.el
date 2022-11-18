;;; tealeg--rust -- Rust setup for emacs
;;;
;;; Commentary:
;;;	Setup Rust support
;;;
;;; Code:
(straight-use-package 'rustic)
(require 'tealeg--lsp)
(straight-use-package 'company)
(straight-use-package 'yasnippet)
(straight-use-package 'flycheck)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'dap-mode)


(defun tealeg--rustic-helper ()
  (lsp-rust-switch-server 'rust-analyzer)
  (define-key rustic-mode-map "M-j"  lsp-ui-imenu)
  (define-key rustic-mode-map "M-?" lsp-find-references)
  (define-key rustic-mode-map "C-c C-c l"  flycheck-list-errors)
  (define-key rustic-mode-map "C-c C-c a"  lsp-execute-code-action)
  (define-key rustic-mode-map "C-c C-c r"  lsp-rename)
  (define-key rustic-mode-map "C-c C-c q"  lsp-workspace-restart)
  (define-key rustic-mode-map "C-c C-c Q"  lsp-workspace-shutdown)
  (define-key rustic-mode-map "C-c C-c s"  lsp-rust-analyzer-status)
  (setq rustic-format-on-save t)

  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))

  (add-hook 'before-save-hook 'lsp-format-buffer nil t)

  (setq lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-eldoc-render-all t
        lsp-idle-delay 0.6
        ;; enable / disable the hints as you prefer:
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial"
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil
        lsp-rust-analyzer-display-closure-return-type-hints t
        lsp-rust-analyzer-display-parameter-hints nil
        lsp-rust-analyzer-display-reborrow-hints nil)

  (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  (setq lsp-ui-peek-always-show t
        lsp-ui-sideline-show-hover t
        lsp-ui-doc-enable nil)

  (setq company-idle-delay 0.5) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  (bind-key company-active-map "C-n" company-select-next)
  (bind-key company-active-map "C-p" company-select-previous)
  (bind-key company-active-map "M-<" company-select-first)
  (bind-key company-active-map "M->" company-select-last)

  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode)

  (bind-key company-mode-map
	    "<tab>" tab-indent-or-complete)
  (bind-key company-mode-map "TAB" tab-indent-or-complete)

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
  

  (exec-path-from-shell-initialize)

  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  (require 'dap-cpptools)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Run"
	 :gdbpath "rust-lldb"
         :target nil
         :cwd nil))

  )

(add-hook 'rustic-mode-hook 'tealeg--rustic-helper)
(provide 'tealeg--rust)



;;; tealeg--rust.el ends here



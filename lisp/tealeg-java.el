(straight-use-package 'lsp-java)
(add-hook 'java-mode-hook #'lsp)


(straight-use-package 'projectile)
(straight-use-package 'flycheck)
(straight-use-package 'yasnippet)
(straight-use-package 'lsp-mode)
(straight-use-package 'hydra)
(straight-use-package 'company)
(straight-use-package 'lsp-ui)
(straight-use-package 'which-key)
;; (straight-use-package 'dap-mode)
;;(straight-use-package 'dap-java)
(straight-use-package 'lsp-treemacs)

(defun java-helper ()
  (lsp-mode 1)
  (setq lsp-completion-enable-additional-text-edit nil)
  (yas-mode 1)
  (which-key-mode 1)
  (dap-auto-configure-mode 1)
  )

(add-hook 'lsp-mode #'tealeg-java-helper)

(provide 'tealeg-java)
;;; tealeg-java.el ends here.



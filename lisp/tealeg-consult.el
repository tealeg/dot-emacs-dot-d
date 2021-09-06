(straight-use-package 'consult)
(straight-use-package 'consult-flycheck)


;; (define-key consult-mode-map (kbd "C-c h") #'consult-history)
;; (define-key consult-mode-map (kbd "C-c m") #'consult-mode-command)
;; (define-key consult-mode-map (kbd "C-c b") #'consult-bookmark)
;; (define-key consult-mode-map (kbd "C-c k") #'consult-kmacro)
;; ;; C-x bindings (ctl-x-map)
;; (define-key consult-mode-map (kbd "C-x M-:") #'consult-complex-command)     ;; orig. repeat-complex-command
;; (define-key consult-mode-map (kbd "C-x b") #'consult-buffer)                ;; orig. switch-to-buffer
;; (define-key consult-mode-map (kbd "C-x 4 b") #'consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
;; (define-key consult-mode-map (kbd "C-x 5 b") #'consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
;; ;; Custom M-# bindings for fast register access
;; (define-key consult-mode-map (kbd "M-#") #'consult-register-load)
;; (define-key consult-mode-map (kbd "M-'") #'consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
;; (define-key consult-mode-map (kbd "C-M-#") #'consult-register)
;; ;; Other custom bindings
;; (define-key consult-mode-map (kbd "M-y") #'consult-yank-pop)                ;; orig. yank-pop
;; (define-key consult-mode-map (kbd "<help> a") #'consult-apropos)            ;; orig. apropos-command
;; ;; M-g bindings (goto-map)
;; (define-key consult-mode-map (kbd "M-g e") #'consult-compile-error)
;; (define-key consult-mode-map (kbd "M-g f") #'consult-flymake)               ;; Alternative: consult-flycheck
;; (define-key consult-mode-map (kbd "M-g g") #'consult-goto-line)             ;; orig. goto-line
;; (define-key consult-mode-map (kbd "M-g M-g") #'consult-goto-line)           ;; orig. goto-line
;; (define-key consult-mode-map (kbd "M-g o") #'consult-outline)               ;; Alternative: consult-org-heading
;; (define-key consult-mode-map (kbd "M-g m") #'consult-mark)
;; (define-key consult-mode-map (kbd "M-g k") #'consult-global-mark)
;; (define-key consult-mode-map (kbd "M-g i") #'consult-imenu)
;; (define-key consult-mode-map (kbd "M-g I") #'consult-imenu-multi)
;; ;; M-s bindings (search-map)
;; (define-key consult-mode-map (kbd "M-s f") #'consult-find)
;; (define-key consult-mode-map (kbd "M-s F") #'consult-locate)
;; (define-key consult-mode-map (kbd "M-s g") #'consult-grep)
;; (define-key consult-mode-map (kbd "M-s G") #'consult-git-grep)
;; (define-key consult-mode-map (kbd "M-s r") #'consult-ripgrep)
;; (define-key consult-mode-map (kbd "M-s l") #'consult-line)
;; (define-key consult-mode-map (kbd "M-s L") #'consult-line-multi)
;; (define-key consult-mode-map (kbd "M-s m") #'consult-multi-occur)
;; (define-key consult-mode-map (kbd "M-s k") #'consult-keep-lines)
;; (define-key consult-mode-map (kbd "M-s u") #'consult-focus-lines)
;; ;; Isearch integration
;; (define-key consult-mode-map (kbd "M-s e") #'consult-isearch)

;; (define-key isearch-mode-map (kbd "M-e") #'consult-isearch)                 ;; orig. isearch-edit-string
;; (define-key isearch-mode-map (kbd "M-s e") #'consult-isearch)               ;; orig. isearch-edit-string
;; (define-key isearch-mode-map (kbd "M-s l") #'consult-line)                  ;; needed by consult-line to detect isearch
;; (define-key isearch-mode-map (kbd "M-s L") #'consult-line-multi)

;; (add-hook completion-list-mode-hook (lambda () (consult-preview-at-point-mode 1)))

;; (setq register-preview-delay 0
;;       register-preview-function #'consult-register-format)

(provide 'tealeg-consult)

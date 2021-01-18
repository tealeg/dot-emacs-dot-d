;;; tealeg-consult.el -- consult config
;;;
;;; Commentary:
;;;	Configure consult.
;;;
;;; Code:

(straight-use-package 'consult)
(straight-use-package 'consult-flycheck)
(straight-use-package 'selectrum)
(straight-use-package 'consult-selectrum)

(selectrum-mode 1)

(global-set-key (kbd "C-x M-:") 'consult-complex-command)
(global-set-key (kbd "C-c h") 'consult-history)
(global-set-key (kbd "C-c m") 'consult-mode-command)
(global-set-key (kbd "C-c k") 'consult-keep-lines)
(global-set-key (kbd "C-c C-k") 'consult-focus-lines)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window)
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)
(global-set-key (kbd "C-x r x") 'consult-register)
(global-set-key (kbd "C-x r b") 'consult-bookmark)
(global-set-key (kbd "M-g g") 'consult-goto-line)
(global-set-key (kbd "M-g M-g") 'consult-goto-line)
(global-set-key (kbd "M-g o") 'consult-outline)       ;; "M-s o" is a good alternative.
(global-set-key (kbd "M-g l") 'consult-line)          ;; "M-s l" is a good alternative.
(global-set-key (kbd "M-g m") 'consult-mark)          ;; I recommend to bind Consult navigation
(global-set-key (kbd "M-g k") 'consult-global-mark)   ;; commands under the "M-g" prefix.
(global-set-key (kbd "M-g r") 'consult-git-grep)      ;; or consult-grep, consult-ripgrep
(global-set-key (kbd "M-g f") 'consult-find)          ;; or consult-locate, my-fdfind
(global-set-key (kbd "M-g i") 'consult-project-imenu) ;; or consult-imenu
(global-set-key (kbd "M-g e") 'consult-error)
(global-set-key (kbd "M-s m") 'consult-multi-occur)
(global-set-key (kbd "M-y") 'consult-yank-pop)
(global-set-key (kbd "<help> a") 'consult-apropos)

;; Custom command wrappers. It is generally encouraged to write your own
;; commands based on the Consult commands. Some commands have arguments which
;; allow tweaking. Furthermore global configuration variables can be set
;; locally in a let-binding.
(defun my-fdfind (&optional dir)
  (interactive "P")
  (let ((consult-find-command '("fdfind" "--color=never" "--full-path")))
    (consult-find dir)))

;; Replace `multi-occur' with `consult-multi-occur', which is a drop-in replacement.
(fset 'multi-occur #'consult-multi-occur)

;; Configure register preview function.
;; This gives a consistent display for both `consult-register' and
;; the register preview when editing registers.
(setq register-preview-delay 0
      register-preview-function #'consult-register-preview)

;; Configure preview. Note that the preview-key can also be configured on a
;; per-command basis via `consult-config'.
;; The default value is 'any, such that any key triggers the preview.
;; (setq consult-preview-key 'any)
;; (setq consult-preview-key (kbd "M-p"))
;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))

;; Optionally configure narrowing key.
;; Both < and C-+ work reasonably well.
(setq consult-narrow-key "<") ;; (kbd "C-+")
;; Optionally make narrowing help available in the minibuffer.
;; Probably not needed if you are using which-key.
;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

;; Optional configure a view library to be used by `consult-buffer'.
;; The view library must provide two functions, one to open the view by name,
;; and one function which must return a list of views as strings.
;; Example: https://github.com/minad/bookmark-view/
;; (setq consult-view-open-function #'bookmark-jump
;;       consult-view-list-function #'bookmark-view-names)

;; Optionally configure a function which returns the project root directory
(autoload 'projectile-project-root "projectile")
(setq consult-project-root-function #'projectile-project-root)

(provide 'tealeg-consult)
;;; tealeg-consult.el ends here

;;; tealeg--modern.el --- here we make emacs act like its a youthful editor
;;;
;;; Commentary:
;;;	All the latest gadgets to make coding more of a pleasure.
;;;
;;; Code:

(require 'straight)
(require 'tealeg--litter)

(straight-use-package 'which-key)
(require 'which-key)

(which-key-mode 1)

(straight-use-package 'marginalia)
(require 'marginalia)
(setq marginalia-max-relative-age 0)
(setq marginalia-align 'right)
(marginalia-mode 1)

(when (display-graphic-p)
  (straight-use-package 'all-the-icons)
  (straight-use-package 'all-the-icons-completion)
  (require 'all-the-icons)
  (require 'all-the-icons-completion)
  (let ((ati-bootstrap-file (expand-file-name "icons-loaded" user-emacs-directory)))
    (unless (file-exists-p ati-bootstrap-file)
      (all-the-icons-install-fonts t)
      (with-temp-buffer (write-file ati-bootstrap-file nil))))
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)
  (all-the-icons-completion-mode 1))



(straight-use-package 'vertico)
(require 'vertico)
(add-to-list 'load-path "~/.config/emacs/straight/repos/vertico/extensions/")
(require 'vertico-indexed)
(require 'vertico-flat)
(require 'vertico-grid)
(require 'vertico-mouse)
(require 'vertico-quick)
(require 'vertico-buffer)
(require 'vertico-repeat)
(require 'vertico-reverse)
(require 'vertico-directory)
(require 'vertico-multiform)
(require 'vertico-unobtrusive)

  :config
(vertico-mode 1)
;; Extensions
(vertico-multiform-mode 1)

(straight-use-package 'orderless)
(require 'orderless)
(setq completion-styles '(orderless))
(setq completion-category-defaults nil)    
;; (setq completion-category-overrides
;;    '((file (styles basic-remote ; For `tramp' hostname completion with `vertico'
;;                    orderless
;;                    ))
;;      ))

(setq orderless-component-separator 'orderless-escapable-split-on-space)
(setq orderless-matching-styles
   '(orderless-literal
     orderless-prefixes
     orderless-initialism
     orderless-regexp
     ;; orderless-flex
     ;; orderless-strict-leading-initialism
     ;; orderless-strict-initialism
     ;; orderless-strict-full-initialism
     ;; orderless-without-literal          ; Recommended for dispatches instead
     ))


(straight-use-package 'cape)
(require 'cape)
(add-hook 'emacs-lisp-mode-hook  #'kb/cape-capf-setup-elisp)
(add-hook 'org-mode-hook #'kb/cape-capf-setup-org)
(add-hook 'eshell-mode-hook #'kb/cape-capf-setup-eshell)
;; (add-hook 'git-commit-mode-hook #'kb/cape-capf-setup-git-commit)
(add-hook 'LaTeX-mode-hook #'kb/cape-capf-setup-latex)
(add-hook 'sh-mode-hook #'kb/cape-capf-setup-sh)


(setq cape-dabbrev-min-length 3)

(defun kb/cape-capf-ignore-keywords-elisp (cand)
  "Ignore keywords with forms that begin with \":\" (e.g.
:history)."
  (or (not (keywordp cand))
        (eq (char-after (car completion-in-region--data)) ?:)))
  
(defun kb/cape-capf-setup-elisp ()
    "Replace the default `elisp-completion-at-point'
completion-at-point-function. Doing it this way will prevent
disrupting the addition of other capfs (e.g. merely setting the
variable entirely, or adding to list).

Additionally, add `cape-file' as early as possible to the list."
    (setf (elt (cl-member 'elisp-completion-at-point completion-at-point-functions) 0)
          #'elisp-completion-at-point)
    (add-to-list 'completion-at-point-functions #'cape-symbol)
    ;; I prefer this being early/first in the list
    (add-to-list 'completion-at-point-functions #'cape-file)
    ;; (require 'company-yasnippet)
    ;; (add-to-list 'completion-at-point-functions (cape-company-to-capf #'company-yasnippet)
		 )


;; Org
(defun kb/cape-capf-setup-org ()
  (let (result)
    (dolist (element (list
                      (cape-super-capf #'cape-ispell #'cape-dabbrev)
                      ;; (cape-company-to-capf #'company-yasnippet)
		      )
                     result)
      (add-to-list 'completion-at-point-functions element)))
  )

  ;; Eshell
  (defun kb/cape-capf-setup-eshell ()
    (let ((result))
      (dolist (element '(pcomplete-completions-at-point cape-file) result)
        (add-to-list 'completion-at-point-functions element))
      ))

  ;; Git-commit
  ;; (defun kb/cape-capf-setup-git-commit ()
  ;;   (general-define-key
  ;;    :keymaps 'local
  ;;    :states 'insert
  ;;    "<tab>" 'completion-at-point)      ; Keybinding for `completion-at-point'
  ;;   (let ((result))
  ;;     (dolist (element '(cape-dabbrev cape-symbol) result)
  ;;       (add-to-list 'completion-at-point-functions element))))

  ;; LaTeX
  (defun kb/cape-capf-setup-latex ()
    ;; (require 'company-auctex)
    (let ((result))
      (dolist (element (list
                        ;; First add `company-yasnippet'
                        ;; (cape-company-to-capf #'company-yasnippet)
                        ;; Then add `cape-tex'
                        #'cape-tex
                        ;; Then add `company-auctex' in the order it adds its
                        ;; backends.
                        ;; (cape-company-to-capf #'company-auctex-bibs)
                        ;; (cape-company-to-capf #'company-auctex-labels)
                        ;; (cape-company-to-capf
                        ;;  (apply-partially #'company--multi-backend-adapter
                        ;;                   '(company-auctex-macros company-auctex-symbols company-auctex-environments)))
		       )
        result)
        (add-to-list 'completion-at-point-functions element))))



  (defun kb/cape-capf-setup-sh () nil)

  ;; Silence the pcomplete capf, no errors or messages!
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
  ;; Ensure that pcomplete does not write to the buffer and behaves as a pure
  ;; `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)


(straight-use-package 'corfu)
(require 'corfu)

  ;; Works with `indent-for-tab-command'. Make sure tab doesn't indent when you
  ;; want to perform completion
(setq tab-always-indent 'complete
      completion-cycle-threshold nil      ; Always show candidates in menu
      corfu-auto nil
  corfu-auto-prefix 2
  corfu-auto-delay 0.25

  corfu-min-width 80
  corfu-max-width corfu-min-width     ; Always have the same width
  corfu-count 14
  corfu-scroll-margin 4
  corfu-cycle nil

  ;; `nil' means to ignore `corfu-separator' behavior, that is, use the older
  ;; `corfu-quit-at-boundary' = nil behavior. Set this to separator if using
  ;; `corfu-auto' = `t' workflow in that case, make sure you also set up
  ;; `corfu-separator' and a keybind for `corfu-insert-separator', which my
  ;; configuration already has pre-prepared. Necessary for manual corfu usage with
  ;; orderless, otherwise first component is ignored, unless `corfu-separator'
  ;; is inserted.
  corfu-quit-at-boundary nil
  corfu-separator ?\s            ; Use space
  corfu-quit-no-match 'separator ; Don't quit if there is `corfu-separator' inserted
  corfu-preview-current 'insert  ; Preview first candidate. Insert on input if only one
  corfu-preselect t        ; Preselect first candidate?

  ;; Other
  corfu-echo-documentation nil)        ; Already use corfu-doc



  (global-corfu-mode 1)
  ;; Enable Corfu more generally for every minibuffer, as long as no other
  ;; completion UI is active. If you use Mct or Vertico as your main minibuffer
  ;; completion UI. From
  ;; https://github.com/minad/corfu#completing-with-corfu-in-the-minibuffer
  (defun corfu-enable-always-in-minibuffer ()
    "Enable Corfu in the minibuffer if Vertico/Mct are not active."
    (unless (or (bound-and-true-p mct--active) ; Useful if I ever use MCT
                (bound-and-true-p vertico--input))
      (setq-local corfu-auto nil)       ; Ensure auto completion is disabled
      (corfu-mode 1)))
(add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)


(straight-use-package 'kind-icon)

(setq kind-icon-use-icons t
      kind-icon-default-face 'corfu-default ; Have background color be the same as `corfu' face background
      kind-icon-blend-background nil  ; Use midpoint color between foreground and background colors ("blended"?
      kind-icon-blend-frac 0.08

      ;; NOTE 2022-02-05: `kind-icon' depends `svg-lib' which creates a cache
      ;; directory that defaults to the `user-emacs-directory'. Here, I change that
      ;; directory to a location appropriate to `no-littering' conventions, a
      ;; package which moves directories of other packages to sane locations.
      svg-lib-icons-dir (no-littering-expand-var-file-name "svg-lib/cache/")) ; Change cache dir

  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter) ; Enable `kind-icon'

  ;; Add hook to reset cache so the icon colors match my theme
  ;; NOTE 2022-02-05: This is a hook which resets the cache whenever I switch
  ;; the theme using my custom defined command for switching themes. If I don't
  ;; do this, then the backgound color will remain the same, meaning it will not
  ;; match the background color corresponding to the current theme. Important
  ;; since I have a light theme and dark theme I switch between. This has no
  ;; function unless you use something similar
(add-hook 'kb/themes-hooks #'(lambda () (interactive) (kind-icon-reset-cache)))

(add-to-list 'load-path "~/.config/emacs/straight/repos/corfu/extensions/")
(require 'corfu-popupinfo)
(corfu-popupinfo-mode 1)

(provide 'tealeg--modern)
;;; tealeg--modern.el ends here

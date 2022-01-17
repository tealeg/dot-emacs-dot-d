;;; tealeg-teal-theme.el --- the ol' tealeg's good ol' teal theme

(deftheme tealeg-teal
  "The ol' tealeg's good ol' teal theme.")

(let ((class '((class color) (min-colors 10)))
      (black "black") ;; #000000
      (teal "systemTealColor") ;; #0071a4
      (white "white") ;; #ffffff
      (lgray "light gray") ;; #d3d3d3
      (lgreen "light green") ;; #90ee90
      (turquoise "turquoise1") ;; #00f5ff
      )

  (custom-theme-set-faces
   'tealeg-teal

   `(default ((,class (:foreground ,lgray :background ,teal))))
   `(cursor ((,class (:background ,lgray))))

   ;; Highlighting faces
   `(fringe ((,class (:foreground ,white :background ,teal))))
   `(highlight ((,class (:foreground ,teal :background ,lgray))))
   `(region ((,class (:foreground ,teal :background ,lgray))))
   `(secondary-selection ((,class (:foreground: ,teal :background ,turquoise))))
   `(isearch ((,class (:foreground ,teal :background ,lgray))))
   `(lazy-highlight ((,class (:foreground ,teal :background ,lgray))))
   `(linum ((,class (:foreground ,lgreen :slant italic))))
   `(trailing-whitespace ((,class (:background "red"))))

   ;; Mode line faces
   `(mode-line
     ((,class (:box (:line-width 5
		     :color ,teal)
	       :overline ,lgray
	       :background ,teal
	       :foreground ,lgray))))
   `(mode-line-inactive
     ((,class (:box (:line-width 5
		     :color ,teal)
	       :overline ,white
	       :background ,teal
	       :foreground ,lgreen))))

   ;; Whitespace-mode
   `(whitespace-empty ((,class (:background unspecified :foreground "red"))))
   `(whitespace-line ((,class (:background ,lgray :foreground ,teal))))

   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:weight bold :foreground ,lgray))))
   `(escape-glyph ((,class (:foreground ,lgray))))
   `(error ((,class (:weight bold :slant italic :foreground "red"))))
   `(warning ((,class (:foreground "yellow"))))
   `(success ((,class (:foreground "green"))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,lgray))))
   `(font-lock-comment-face ((,class (:slant italic :foreground ,lgreen))))
   `(font-lock-constant-face ((,class (:weight bold :foreground ,lgray))))
   `(font-lock-function-name-face ((,class (:foreground ,white))))
   `(font-lock-keyword-face ((,class (:weight bold :foreground ,white))))
   `(font-lock-string-face ((,class (:foreground ,turquoise))))
   `(font-lock-type-face ((,class (:weight bold :foreground ,lgray))))
   `(font-lock-variable-name-face ((,class (:weight bold :foreground ,turquoise))))
   `(font-lock-warning-face ((,class (:foreground "yellow"))))

   ;; Button and link faces
   `(link ((,class (:underline t :foreground ,lgray))))
   `(link-visited ((,class (:underline t :foreground ,lgray))))

   ;; Show-paren
   `(show-paren-match ((t (:background ,lgreen :foreground ,teal))))
   `(show-paren-mismatch ((t (:background "red"))))

   ;; Speedbar
   `(speedbar-button-face ((,class (:foreground ,lgreen))))
   `(speedbar-file-face ((,class (:foreground ,lgray))))
   `(speedbar-directory-face ((,class (:weight bold :foreground ,white))))
   `(speedbar-tag-face ((,class (:foreground ,lgreen))))
   `(speedbar-selected-face ((,class (:underline ,lgray :foreground ,lgray))))
   `(speedbar-highlight-face ((,class (:weight bold :background ,teal :foreground ,white))))

   ;; ido
   `(ido-first-match ((,class (:foreground ,lgray))))
   `(ido-only-match ((,class (:underline ,lgray :foreground ,lgray))))
   `(ido-subdir ((,class (:weight bold :foreground ,white))))

   ;; MuMaMo
   `(mumamo-background-chunk-major ((,class (:background ,teal))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,teal))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,teal))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,teal))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,teal))))
   `(mumamo-border-face-in ((,class (:slant unspecified :underline unspecified
                                     :weight bold :foreground ,white))))
   `(mumamo-border-face-out ((,class (:slant unspecified :underline unspecified
                                      :weight bold :foreground ,white))))

   ;; Gnus faces
   `(gnus-group-news-1 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-news-1-low ((,class (:foreground ,lgray))))
   `(gnus-group-news-2 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-news-2-low ((,class (:foreground ,lgray))))
   `(gnus-group-news-3 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-news-3-low ((,class (:foreground ,lgray))))
   `(gnus-group-news-4 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-news-4-low ((,class (:foreground ,lgray))))
   `(gnus-group-news-5 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-news-5-low ((,class (:foreground ,lgray))))
   `(gnus-group-news-low ((,class (:foreground ,lgray))))
   `(gnus-group-mail-1 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-mail-1-low ((,class (:foreground ,lgray))))
   `(gnus-group-mail-2 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-mail-2-low ((,class (:foreground ,lgray))))
   `(gnus-group-mail-3 ((,class (:weight bold :foreground ,lgray))))
   `(gnus-group-mail-3-low ((,class (:foreground ,lgray))))
   `(gnus-group-mail-low ((,class (:foreground ,lgray))))
   `(gnus-header-content ((,class (:foreground ,lgray))))
   `(gnus-header-from ((,class (:weight bold :foreground ,lgray))))
   `(gnus-header-subject ((,class (:foreground ,lgray))))
   `(gnus-header-name ((,class (:foreground ,lgray))))
   `(gnus-header-newsgroups ((,class (:foreground ,lgray))))

   ;; Message faces
   `(message-header-name ((,class (:foreground ,lgray))))
   `(message-header-cc ((,class (:foreground ,lgray))))
   `(message-header-other ((,class (:foreground ,lgray))))
   `(message-header-subject ((,class (:foreground ,lgray))))
   `(message-header-to ((,class (:weight bold :foreground ,lgray))))
   `(message-cited-text ((,class (:slant italic :foreground ,lgray))))
   `(message-separator ((,class (:weight bold :foreground ,lgray))))

   ;; EShell
   `(eshell-prompt ((,class (:foreground ,white :bold t))))
   `(eshell-ls-archive ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-backup ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-clutter ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-directory ((,class (:foreground ,lgray :bold t))))
   `(eshell-ls-executable ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-missing ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-product ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-readonly ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-special ((,class (:inherit eshell-ls-unreadable))))
   `(eshell-ls-symlink ((,class (:inherit eshell-ls-unreadable))))

   ;; Org-mode
   `(org-level-1 ((t (:bold t :foreground ,lgray :height 1.5))))
   `(org-level-2 ((t (:bold nil :foreground ,lgray :height 1.2))))
   `(org-level-3 ((t (:bold t :foreground ,lgray :height 1.0))))
   `(org-level-4 ((t (:bold nil :foreground ,lgray :height 1.0))))
   `(org-link ((t (:foreground ,turquoise :underline t))))
   `(org-todo ((t (:bold t :foreground "red"))))
   `(org-done ((t (:bold t :foreground "green"))))

   ;; helm
   `(helm-header ((t (:foreground ,lgreen :background ,teal :underline nil :box nil))))
   `(helm-source-header
     ((t (:foreground ,white
                      :background ,teal
                      :underline nil
                      :weight bold
                      :box (:line-width 1 :style released-button)))))
   `(helm-selection ((t (:background ,lgray :underline t :foreground ,teal))))
   `(helm-selection-line ((t (:background ,teal))))
   `(helm-visible-mark ((t (:foreground ,teal :background ,white))))
   `(helm-candidate-number ((t (:foreground ,lgray :background ,teal))))
   `(helm-separator ((t (:foreground ,white :background ,teal))))
   `(helm-time-zone-current ((t (:foreground ,lgray :background ,teal))))
   `(helm-time-zone-home ((t (:foreground ,white :background ,teal))))
   `(helm-bookmark-addressbook ((t (:foreground ,lgray :background ,teal))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,white :background ,teal))))
   `(helm-bookmark-info ((t (:foreground ,lgray :background ,teal))))
   `(helm-bookmark-man ((t (:foreground ,white :background ,teal))))
   `(helm-bookmark-w3m ((t (:foreground ,white :background ,teal))))
   `(helm-buffer-not-saved ((t (:foreground ,white :background ,teal))))
   `(helm-buffer-process ((t (:foreground ,white :background ,teal))))
   `(helm-buffer-saved-out ((t (:foreground ,lgray :background ,teal))))
   `(helm-buffer-size ((t (:foreground ,lgray :background ,teal))))
   `(helm-ff-directory ((t (:foreground ,white :background ,teal :weight bold))))
   `(helm-ff-file ((t (:foreground ,lgray :background ,teal :weight normal))))
   `(helm-ff-executable ((t (:foreground ,lgray :background ,teal :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,white :background ,teal :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,white :background ,teal :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,teal :background ,white :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,white :background ,teal))))
   `(helm-grep-file ((t (:foreground ,lgray :background ,teal))))
   `(helm-grep-finish ((t (:foreground ,lgray :background ,teal))))
   `(helm-grep-lineno ((t (:foreground ,lgray :background ,teal))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,white :background ,teal))))
   `(helm-moccur-buffer ((t (:foreground ,white :background ,teal))))
   `(helm-mu-contacts-address-face ((t (:foreground ,lgray :background ,teal))))
   `(helm-mu-contacts-name-face ((t (:foreground ,lgray :background ,teal))))

   ;; Flyspell
   `(flyspell-duplicate ((,class (:weight unspecified :foreground unspecified
				  :slant unspecified :underline ,lgray))))
   `(flyspell-incorrect ((,class (:weight unspecified :foreground unspecified
				  :slant unspecified :underline ,lgray)))))

  (custom-theme-set-variables
   'tealeg-teal
   `(ansi-color-names-vector [,teal ,lgray ,lgreen ,turquoise])))

;; Autoload for MELPA

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'tealeg-teal)

(provide 'tealeg-teal-theme)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; tealeg-teal-theme.el ends here


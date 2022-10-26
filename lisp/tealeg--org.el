;;; tealeg--org --- Org mode setup
;;;
;;; Commentary:
;;;     Org is one of the most important pieces of the Emacs puzzle, here's my config.
;;;
;;; Code:

(straight-use-package 'org)
(straight-use-package 'org-present)


(require 'org)
(require 'org-agenda)
;; (require 'org-tempo)
(require 'flyspell)
(require 'org-faces)

;; Hide emphasis markers on formatted text
(setq org-hide-emphasis-markers t)

;; Resize Org headings
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'medium :height (cdr face)))

;; Make the document title a bit bigger
(set-face-attribute 'org-document-title nil :font "Iosevka Aile" :weight 'bold :height 1.3)


(setq org-agenda-files '("~/org/") )
(setq org-todo-keywords '((sequence "TODO" "QUERY" "PLANNING" "PLANNED" "IN-PROGRESS" "DELEGATED" "BLOCKED" "|" "CANCELLED" "DONE")))

(setq   org-startup-indented t
        org-pretty-entities t
        org-startup-with-inline-images t
        org-image-actual-width '(300)
        )

;; (require 'ox-publish)
;; (setq org-publish-project-alist
;;       '(

;;        ("org-files"
;;        :base-directory "~/src/personal/blog/orgfiles/"
;;        :base-extension "org"
;;        :publishing-directory "~/src/personal/blog/html/"
;;        :recursive t
;;        :publishing-function org-html-publish-to-html
;;        :headline-levels 4
;;        :auto-preamble nil
;;        ;:html-preamble "<header><h1><a href=\"index.html\">Would rather be on the beach...</a></h1></header>"
;;        :html-postamble "<hr><a href=\"/\">Home Page</a>"
;;        :html-head "<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\"/>"
;;        )

;;        ("org-static"
;;        :base-directory "~/src/personal/blog/orgfiles/"
;;        :base-extension "css\\|htaccess\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt"
;;        :publishing-directory "~/src/personal/blog/html/"
;;        :recursive t
;;        :publishing-function org-publish-attachment
;;        )

;;        ("rss"
;;         :base-directory "~/src/personal/blog/orgfiles/"
;;         :base-extension "org"
;;         :rss-image-url "https://example.com/images/image"
;;         :html-link-home "https://example.com"
;;         :html-link-use-abs-url t
;;         :rss-extension "xml"
;;         :publishing-directory "~/src/personal/blog/html/"
;;         :publishing-function (org-rss-publish-to-rss)
;;         :section-numbers nil
;;         :exclude ".*"            ;; To exclude all files...
;;         :include ("index.org")   ;; ... except index.org.
;;         :table-of-contents nil
;;        )

;;        ("images"
;;        :base-directory "~/src/personal/blog/orgfiles/images"
;;        :base-extension "png\\|jpg\\|gif"
;;        :publishing-directory "~/src/personal/blog/html/images"
;;        :recursive t
;;        :publishing-function org-publish-attachment
;;        )

;;        ("font"
;;        :base-directory "~/src/personal/blog/orgfiles/font"
;;        :base-extension "ttf"
;;        :publishing-directory "~/src/personal/blog/html/font"
;;        :recursive t
;;        :publishing-function org-publish-attachment
;;        )

;;        ; the name of the publishing project, in this case "website"
;;        ; publish the org mode blog

;;        ("website" :components ("org-files" "org-static" "images" "font" "rss"))

;;       ))


;; (straight-use-package 'ox-rss)


;; Hide emphasis markers on formatted text
(setq org-hide-emphasis-markers t)

;; Resize Org headings
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'medium :height (cdr face)))

;; Make the document title a bit bigger
(set-face-attribute 'org-document-title nil :font "Iosevka Aile" :weight 'bold :height 1.3)

;; Make sure certain org faces use the fixed-pitch face when variable-pitch-mode is on
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

;; (defun my/org-present-prepare-slide (buffer-name heading)
;;   ;; Show only top-level headlines
;;   (org-overview)

;;   ;; Unfold the current entry
;;   (org-show-entry)

;;   ;; Show only direct subheadings of the slide but don't expand them
;;   (org-show-children))

;; (add-hook 'org-present-after-navigate-functions 'my/org-present-prepare-slide)

(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))



(provide 'tealeg--org)
;;; tealeg--org.el ends here.

;;; tealeg--org --- Org mode setup
;;;
;;; Commentary:
;;;     Org is one of the most important pieces of the Emacs puzzle, here's my config.
;;;
;;; Code:

(straight-use-package 'org)
(straight-use-package 'org-bullets)
(straight-use-package 'org-present)

(require 'org)
(require 'org-bullets)
(require 'org-tempo)
(require 'flyspell)

(setq org-todo-keywords '((sequence "TODO" "QUERY" "PLANNING" "PLANNED" "IN-PROGRESS" "DELEGATED" "BLOCKED" "|" "CANCELLED" "DONE")))

(defun org-mode-helper-f ()
  "Setup Org mode on demand."
  (setq org-hide-emphasis-markers t
        org-hide-block-startup t
        org-hide-leading-stars t
        org-hide-macro-markers t
        )
  (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  (org-bullets-mode 1)
  (flyspell-mode 1)
  (org-tempo-setup))

(add-hook 'org-mode-hook #'org-mode-helper-f)

(require 'ox-publish)
(setq org-publish-project-alist
      '(

       ("org-files"
       :base-directory "~/src/personal/blog/orgfiles/"
       :base-extension "org"
       :publishing-directory "~/src/personal/blog/html/"
       :recursive t
       :publishing-function org-html-publish-to-html
       :headline-levels 4
       :auto-preamble nil
       ;:html-preamble "<header><h1><a href=\"index.html\">Would rather be on the beach...</a></h1></header>"
       :html-postamble "<hr><a href=\"/\">Home Page</a>"
       :html-head "<link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\"/>"
       )

       ("org-static"
       :base-directory "~/src/personal/blog/orgfiles/"
       :base-extension "css\\|htaccess\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt"
       :publishing-directory "~/src/personal/blog/html/"
       :recursive t
       :publishing-function org-publish-attachment
       )

       ("rss"
        :base-directory "~/src/personal/blog/orgfiles/"
        :base-extension "org"
        :rss-image-url "https://example.com/images/image"
        :html-link-home "https://example.com"
        :html-link-use-abs-url t
        :rss-extension "xml"
        :publishing-directory "~/src/personal/blog/html/"
        :publishing-function (org-rss-publish-to-rss)
        :section-numbers nil
        :exclude ".*"            ;; To exclude all files...
        :include ("index.org")   ;; ... except index.org.
        :table-of-contents nil
       )

       ("images"
       :base-directory "~/src/personal/blog/orgfiles/images"
       :base-extension "png\\|jpg\\|gif"
       :publishing-directory "~/src/personal/blog/html/images"
       :recursive t
       :publishing-function org-publish-attachment
       )

       ("font"
       :base-directory "~/src/personal/blog/orgfiles/font"
       :base-extension "ttf"
       :publishing-directory "~/src/personal/blog/html/font"
       :recursive t
       :publishing-function org-publish-attachment
       )

       ; the name of the publishing project, in this case "website"
       ; publish the org mode blog

       ("website" :components ("org-files" "org-static" "images" "font" "rss"))

      ))


(straight-use-package 'ox-rss)


(provide 'tealeg--org)
;;; tealeg--org.el ends here.

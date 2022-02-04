;; (straight-use-package 'org-mode)

(require 'org)
(require 'org-tempo)
(require 'flyspell)

(setq org-todo-keywords '((sequence "TODO" "QUERY" "PLANNING" "PLANNED" "IN-PROGRESS" "DELEGATED" "BLOCKED" "|" "CANCELLED" "DONE")))

(defun org-mode-helper-f ()
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

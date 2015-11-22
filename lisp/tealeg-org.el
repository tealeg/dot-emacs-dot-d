;;; tealeg-org.el --- Custom org setup for producing www.teale.de.
;;;
;;; Commentary:
;;;		This file sets up org-mode to publish www.teale.de.
;;;
;;; Code:

(require 'org)
(require 'ox-rss)


(defvar tealeg-website-html-head
  "<link rel='stylesheet' href='css/site.css' type='text/css'/>
<link rel='stylesheet' href='css/octicons/octicons.css' type='text/css'/>
<link rel='alternate' type='application/rss+xml' href='http://www.teale.de/blog/index.xml' title='RSS feed for mydomain.org'/>")

(defvar tealeg-website-html-blog-head "<link rel='stylesheet' href='../css/site.css' type='text/css'/>
<link rel='stylesheet' href='../css/octicons/octicons.css' type='text/css'/>
<link rel='alternate' type='application/rss+xml' href='http://www.teale.de/blog/index.xml' title='RSS feed for mydomain.org'/>")

(defvar tealeg-website-html-preamble

  "
<div class='heading'>Geoffrey J. Teale</div>
<div class='nav'>
<ul>
<li class='nav-item'><a href='/'><span class='octicon octicon-home'></span>&nbsp;Home</a></li>
<li class='nav-item'><a href='/blog/index.html'><span class='octicon octicon-megaphone'></span>&nbsp;Blog</a></li>
<li class='nav-item'><a href='http://github.com/tealeg'><span class='octicon octicon-mark-github'></span>&nbsp;GitHub</a></li>
<li class='nav-item'><a href='/about.html'><span class='octicon octicon-person'></span>&nbsp;About</a></li>
</ul>
</div>")

(defvar tealeg-website-html-postamble
  "<div class='footer'>
Copyright 2015 %a (%v HTML).<br>
Last updated %C. <br>
Built with %c.
</div>")


(setq org-publish-project-alist
      `(("org"
         :base-directory "~/org/website/"
         :base-extension "org"
         :publishing-directory "~/Public/www.teale.de/"
         :publishing-function org-html-publish-to-html
         :section-numbers nil
         :with-toc nil
         :html-head ,tealeg-website-html-head
         :html-preamble ,tealeg-website-html-preamble
         :html-postamble ,tealeg-website-html-postamble)

        ("blog"
         :base-directory "~/org/website/blog"
         :base-extension "org"
         :publishing-directory "~/Public/www.teale.de/blog/"
         :publishing-function org-html-publish-to-html
         :section-numbers nil
         :with-toc nil
         :html-head ,tealeg-website-html-blog-head
         :html-head-extra
         "<link rel=\"alternate\" type=\"application/rss+xml\"
                href=\"http://www.teale.de/blog/blog.xml\"
                title=\"RSS feed\">"
         :html-preamble ,tealeg-website-html-preamble
         :html-postamble ,tealeg-website-html-postamble)

        ("images"
         :base-directory "~/org/website/images/"
         :base-extension "jpg\\|gif\\|png"
         :publishing-directory "~/Public/www.teale.de/images/"
         :publishing-function org-publish-attachment)

        ("js"
         :base-directory "~/org/website/js/"
         :base-extension "js"
         :publishing-directory "~/Public/www.teale.de/js/"
         :publishing-function org-publish-attachment)

        ("css"
         :base-directory "~/org/website/css/"
         :base-extension "css"
         :publishing-directory "~/Public/www.teale.de/css/"
         :exclude "octicons"
         :publishing-function org-publish-attachment)

        ("octicons"
         :base-directory "~/org/website/css/octicons/"
         :publishing-directory "~/Public/www.teale.de/css/octicons/"
         :base-extension "css\\|eot\\|less\\|ttf\\|scss\\|svg\\|woff"
         :publishing-function org-publish-attachment)

        ("rss"
         :base-directory "~/org/website/blog"
         :base-extension "org"
         :publishing-directory "~/Public/www.teale.de/blog"
         :publishing-function (org-rss-publish-to-rss)
         :html-link-home "http://www.teale.de/blog/"
         :html-link-use-abs-url t
         :with-toc nil
         :section-numbers nil
         :title "tealeg's brain welcomes careful drivers.")

        ("english4kids"
         :base-directory "~/org/website/english4kids"
         :publishing-directory "~/Public/www.teale.de/english4kids"
         :base-extension "css\\|jpg\\|html"
         :recursive t
         :publishing-function org-publish-attachment)

        ("website" :components ("org" "blog" "images" "js" "css" "octicons" "rss" "english4kids"))))


(provide 'tealeg-org)
;;; tealeg-org.el ends here

(require 'org)
(require 'ox-publish)

(setq org-publish-project-alist
      '(
	("org"
	 :base-directory "~/org"
	 :publishing-directory "~/Public/"
	 :recursive 1
	 :publishing-function org-html-publish-to-html
	 :with-toc t
	 :section-numbers nil)
	("images"
	 :base-directory "~/org/images"
	 :publishing-directory "~/Public/images"
	 :base-extension "jpg\\|gif\\|png"
	 :publishing-function org-publish-attachment)
	("lib"
	 :base-directory "~/org/lib"
	 :publishing-directory "~/Public/lib"
	 :base-extension "js"
	 :recursive 1
	 :publishing-function org-publish-attachment)
	("js"
	 :base-directory "~/org/js"
	 :publishing-directory "~/Public/js"
	 :base-extension "js\\|swf"
	 :recursive 1
	 :publishing-function org-publish-attachment)
	("css"
	 :base-directory "~/org/css"
	 :publishing-directory "~/Public/css"
	 :base-extension "css"
	 :publishing-function org-publish-attachment)
	("website"
	 :components ("org" "images" "lib" "js" "css"))
	))

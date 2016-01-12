;;; tealeg-html --- my html settings.
;;;
;;; Commentary:
;;;     Html setup

;;; Code:

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((js2-mode "<script[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("htm" "html" "pt"))
(multi-web-global-mode 1)
(provide 'tealeg-html)
;;; tealeg-html.el ends here

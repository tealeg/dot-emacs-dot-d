;;; tealeg-xwidget-webkit -- setup embedded browser
;;;
;;; Commentary:
;;;   Danger Will Robinson - this is experimental territory.
;;;
;;; Code:

(defun markdown-live-preview-window-xwidget-webkit (file)
  "Preview FILE with eww.
To be used with `markdown-live-preview-window-function'."
  (message file)
  (let ((f (concat "file://" file)))
    (xwidget-webkit-browse-url f nil)
    (get-buffer (concat "*xwidget webkit: " (file-name-base file) ".html *"))))

(when (featurep 'xwidget-internal)
  (progn
    (require 'xwidget)
    (require 'markdown-mode)
    (setq xwidget-webkit-enable-plugins t)
    (setq browse-url-browser-function #'xwidget-webkit-browse-url)
    (setq markdown-live-preview-window-function #'markdown-live-preview-window-xwidget-webkit)
    ))

(provide 'tealeg-xwidget-webkit)
;;; tealeg-xwidget-webkit.el ends here

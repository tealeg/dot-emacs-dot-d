(when (featurep 'xwidget-internal)
  (progn
    (require 'xwidget)
    (setq xwidget-webkit-enable-plugins t)
    (setq browse-url-browser-function #'xwidget-webkit-browse-url)
    ))

(provide 'tealeg-xwidget-webkit)
  

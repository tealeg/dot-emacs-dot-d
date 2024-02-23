;; Some performance 
(use-package gcmh :ensure t)

(elpaca nil
  (require 'jsonrpc)
  (require 'eglot)
  (require 'gcmh)
  (require 'completion)
  (fset #'jsonrpc--loog-event #'ignore)
  (setq eglot-events-buffer-size 0)
  (setq eglot-sync-connect nil)
  (setq eglot-connect-timeout nil)

  (gcmh-mode 1))

(provide 'tealeg--performance)

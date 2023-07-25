
(use-package company
  :config (progn
	    (add-to-list 'load-path "~/.emacs.d/elpa/xlsp-0.0.1pre/")
	    (require 'xlsp)
	    (global-xlsp-mode 1)
	    (global-eldoc-mode 1)
    ))


(provide 'tealeg--lsp)

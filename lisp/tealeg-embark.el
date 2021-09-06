(straight-use-package 'embark)
(straight-use-package 'embark-consult)

;; (define-key embark-mode-map (kbd "C-.") #'embark-act)
;; (define-key embark-mode-map (kbd "C-;") #'emark-dwim)
;; (define-key embark-mode-map (kbd "C-h B") #'embark-bindings)

(add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))


(provide 'tealeg-embark)

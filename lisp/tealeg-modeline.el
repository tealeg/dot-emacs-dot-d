;;; tealeg-modeline -- Custom formatting of the mode and header lines.
;;;
;;; Commentary:
;;;     Creates a header line and spreads the indicators between the header and mode line.
;;;
;;; Code:
;;;

(require 'erc-track)

(let* ((font-height (elt (font-info (frame-parameter nil 'font-parameter)) 2))
       (modeline-height (* 2 font-height)))

  ;; use setq-default to set it for /all/ modes
  (setq-default header-line-format
                (list
                 '(2 (:eval (propertize ""
                                        'face '((:family "Ubuntu" :height modeline-height :foreground "#dd4814")))))
                 ;; the buffer name; the file name as a tool tip
                 '(25 (:eval (propertize "%b" 'face 'font-lock-keyword-face
                                         'help-echo (buffer-file-name))))
                 ;; is this buffer read-only?
                 '(1 (:eval (if buffer-read-only
                                (propertize "❌"
                                            'face font-lock-warning-face
                                            'help-echo "Buffer is read-only")
                              (propertize "✓"
                                          'face font-lock-type-face
                                          'help-echo "Buffer is writable")
                              )))
                 ;; was this buffer modified since the last save?
                 '(1 (:eval (if (buffer-modified-p)
                                (propertize "🖪"
                                            'face 'font-lock-keyword-face
                                            'help-echo "Buffer has been modified")
                              (propertize "🖫"
                                          'face 'font-lock-type-face
                                          'help-echo "Buffer unmodified")
                              )))

                 '(15 (:propertize " (%02l,%02c) " 'face 'font-lock-type-face))

                 ;; the current major mode for the buffer.
                 '(15 (:eval (propertize "%m" 'face 'font-lock-type-face
                                         'help-echo buffer-file-coding-system)))

                 '(:eval (format (format "%%%ss" (- (window-width) 90)) " "))
                 
                 '(26 (:eval (format-time-string "%%e %B %Y - %H:%M")))

                 '(:eval (propertize "◉"
                                     'face '((:family "Ubuntu"
                                                      :height modeline-height
                                                      :foreground "#5E2750"))))
                 
                 )))




;; " - "

;; ))

;; (setq-default  mode-line-format
;;                (list
;;                 erc-modified-channels-object

;;                 " - "
;;                 minor-mode-alist  ;; list of minor modes

;;                 ))

(provide 'tealeg-modeline)
;;; tealeg-modeline.el ends here

;;; tealeg-modeline -- Custom formatting of the mode and header lines.
;;;
;;; Commentary:
;;;     Creates a header line and spreads the indicators betwwen the header and mode line.
;;;
;;; Code:
;;;

(require 'erc-track)



;; use setq-default to set it for /all/ modes
(setq-default header-line-format
              (list
               " "
               '(:eval (propertize " " 'face '((:family "Ubuntu" :height 160 :foreground "#dd4814"))))
               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize "%b" 'face 'font-lock-keyword-face
                                   'help-echo (buffer-file-name)))


               " ("
               ;; line and column
                                        ; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-type-face) ","
               (propertize "%02c" 'face 'font-lock-type-face)

               ") "

               ;; the current major mode for the buffer.
               '(:eval (propertize "%m" 'face 'font-lock-type-face
                                   'help-echo buffer-file-coding-system))

               " - "
               ;; was this buffer modified since the last save?
               '(:eval (if (buffer-modified-p)

                           (propertize "ණ"
                                       'face 'font-lock-warning-face
                                       'help-echo "Buffer has been modified")
                         (propertize "_"
                                     'face 'font-lock-type-face
                                     'help-echo "Buffer unmodified")
                         ))
               " "
               ;; is this buffer read-only?
               '(:eval (if buffer-read-only

                           (propertize "❌"
                                       'face font-lock-warning-face
                                       'help-echo "Buffer is read-only")
                         (propertize "✓"
                                     'face font-lock-type-face
                                     'help-echo "Buffer is writable")
                         ))



               " - "
               ;; add the time, with the date and the emacs uptime in the tooltip
               '(:eval (propertize (format-time-string "%H:%M - %A %e %B %Y")
                                   'help-echo
                                   :face 'font-lock-type-face
                                   (concat (format-time-string "%c; ")
                                           (emacs-uptime "Uptime:%hh"))))
               ))

(setq-default  mode-line-format
               (list
                erc-modified-channels-object

                " - "
                minor-mode-alist  ;; list of minor modes

                ))

(provide 'tealeg-modeline)
;;; tealeg-modeline.el ends here

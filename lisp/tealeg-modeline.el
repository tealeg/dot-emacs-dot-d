(require 'fontawesome)
(require 'erc-track)

;; use setq-default to set it for /all/ modes
(setq-default header-line-format
              (list
               (fontawesome "linux")
                " "
                ;; add the time, with the date and the emacs uptime in the tooltip
                '(:eval (propertize (format-time-string "%H:%M - %A %e %B %Y")
                                    'help-echo
                                    :face 'font-lock-type-face
                                    (concat (format-time-string "%c; ")
                                            (emacs-uptime "Uptime:%hh"))))
                " "
                erc-modified-channels-object
                ))

(setq-default  mode-line-format
               (list

                ;; the buffer name; the file name as a tool tip
                '(:eval (propertize "%b" 'face 'font-lock-keyword-face
                                    'help-echo (buffer-file-name)))


                " ("
                ;; line and column
                ; '%02' to set to 2 chars at least; prevents flickering
                (propertize "%02l" 'face 'font-lock-type-face) ","
                (propertize "%02c" 'face 'font-lock-type-face)

                ") "
                

                ;; ;; relative position, size of file
                ;; "["
                ;; (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
                ;; "/"
                ;; (propertize "%I" 'face 'font-lock-constant-face) ;; size
                ;; "] "

                ;; the current major mode for the buffer.


                '(:eval (propertize "%m" 'face 'font-lock-type-face
                                    'help-echo buffer-file-coding-system))

                " - "


                ;; "[" ;; insert vs overwrite mode, input-method in a tooltip
                ;; '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                ;;                     'face 'font-lock-preprocessor-face
                ;;                     'help-echo (concat "Buffer is in "
                ;;                                        (if overwrite-mode "overwrite" "insert") " mode")))
 
                ;; was this buffer modified since the last save?
                '(:eval (if (buffer-modified-p)

                            (propertize (fontawesome "plus-square")
                                        'face 'font-lock-warning-face
                                        'help-echo "Buffer has been modified")
                          (propertize (fontawesome "square-o")
                                      'face 'font-lock-type-face
                                      'help-echo "Buffer unmodified")
                          ))
                " "
                ;; is this buffer read-only?
                '(:eval (if buffer-read-only

                                        (propertize (fontawesome "lock")
                                                    'face 'font-lock-warning-face
                                                    'help-echo "Buffer is read-only")
                                      (propertize (fontawesome "unlock")
                                                  'face 'font-lock-type-face
                                                  'help-echo "Buffer is writable")
                                      ))

                " - "
                minor-mode-alist  ;; list of minor modes

                ))

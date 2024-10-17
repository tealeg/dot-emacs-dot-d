
(when (string= system-type "darwin")
    (progn
      (add-to-list 'load-path "/opt/homebrew/share/emacs/site-lisp/notmuch")
      (require 'notmuch)
      (setq notmuch-fcc-dirs "INBOX.Sent")))

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtpauth.mailroute.net"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587
      user-full-name "gteale"
      smtpmail-local-domain "acm.org"
      user-mail-address "gteale@acm.org"

      )

(provide 'tealeg--mail)

;;; tealeg-mail --- gnus configuration
;;;
;;; Commentary:
;;;
;;; Code:
(require 'gnus)
(require 'gnus-start)
(require 'nnimap)
(require 'smtpmail)

(setq user-mail-address "tealeg@gmail.com"
      user-full-name "Geoffrey J. Teale")

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


(provide 'tealeg-mail)
;;; tealeg-mail.el ends here

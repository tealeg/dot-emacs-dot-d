;;; tealeg-gnus -- my GNUS setup
;;;
;;; Commentary:
;;;    Set up GNUS to handle my mail.
;;;
;;; Code:
(require 'gnus)
(require 'gnus-agent)
(require 'gnus-cache)
(require 'gnus-group)
(require 'smtpmail)
(require 'tls)
(require 'message)
(require 'nnmail)
(require 'nnml)
(require 'nnimap)

(setq gnus-default-directory "~/.emacs.d/Gnus/")
(setq gnus-directory (concat gnus-default-directory "News/")
			message-directory (concat gnus-default-directory "Mail/")
			gnus-home-directory gnus-default-directory)

(setq gnus-article-save-directory gnus-directory
      gnus-kill-files-directory (concat gnus-directory "trash/")
			gnus-agent-directory (concat gnus-directory "agent/")
			gnus-cache-directory (concat gnus-directory "cache/")
			gnus-dribble-directory (concat gnus-directory "dribble/")
			mail-default-directory message-directory
			message-auto-save-directory (concat message-directory "drafts/")
			mail-source-directory (concat message-directory "incoming/")
			nnmail-message-id-cache-file (concat gnus-default-directory ".nnmail-cache")
			nnml-newsgroups-file (concat message-directory "/newsgroup")
			mml-default-directory (concat gnus-directory "MML/"))

(setq gnus-cache-active-file (concat gnus-cache-directory "active"))

(setq gnus-save-newsrc-file nil)

(setq user-full-name "Geoffrey J. Teale")
(setq user-mail-address "geoffrey.teale@canonical.com")

(setq gnus-select-method
      '(nnimap "canonical"
							 (nnimap-address "imap.gmail.com")
							 (nnimap-server-port 993)
							 (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      ;; smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      ;; smtpmail-auth-credentials '(("smtp.gmail.com" 587
			;; 														 "geoffrey.teale@canonical.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")



(provide 'tealeg-gnus)
;;; tealeg-gnus.el ends here

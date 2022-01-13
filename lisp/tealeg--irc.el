;;; tealeg--irc -- configure irc
;;;
;;; Commentary:
;;;	I still find it useful to have IRC in emacs 🤷
;;;
;;; Code:

(require 'erc)

(setq
 erc-nick "tealeg"    
 erc-user-full-name "Geoffrey J. Teale") 

;; Define a function to connect to a server
(defun erc-libera ()
  (interactive)
  (erc-tls :server "irc.libera.chat"
	   :port   "6697"))

(provide 'tealeg--irc)
;;; tealeg--irc.el ends here

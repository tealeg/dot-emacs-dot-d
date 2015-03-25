;;; tealeg-irc --- my irc settings.
;;;
;;; Commentary:
;;;     Irc setup

;;; Code:
(require 'erc)
(require 'tls)
(require 'erc-match)
(require 'erc-services)
(require 'erc-notify)
(require 'auth-source)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(add-to-list 'erc-modules 'notifications)
(erc-services-mode 1)
(setq erc-join-buffer (quote bury))
(setq erc-prompt-for-nickserv-password nil)

(setq erc-keywords '(("landscape-crew" (:foreground "green"))
                     ("away-regexp" (:foreground "red"))))

(add-hook 'erc-text-matched-hook 'erc-beep-on-match)
(setq erc-beep-match-types '(current-nick keyword))
(add-hook 'erc-mode-hook (lambda ()
                           (flyspell-mode 1)
                           (erc-match-enable)
                           (erc-truncate-mode 1)
                           (erc-log-mode 1)
                           (variable-pitch-mode 1)))

(defun start-irc ()
  "Connect to IRC."
  (interactive)
	(let ((secret (plist-get (car (auth-source-search :host "irc.canonical.com")) :secret)))
		(erc-tls :server "irc.canonical.com"
						 :port 6697
						 :nick "tealeg"
						 :full-name "Geoffrey Teale"
						 :password (funcall secret)))
  (setq erc-server-auto-reconnect t)
  (setq erc-server-reconnect-timeout 5)
  (setq erc-autojoin-channels-alist '(("Canonical"
                                       "#landscape"
                                       "#landscape-pvt"
                                       "#canonical"
                                       "#berlin"
                                       "#tech"))))

(defun erc-cmd-INITSWEETIE ()
  "Initialise sweetie aliases."
	(erc-send-message "sweetie: alias land build tarmac now")
	(erc-send-message "sweetie: alias pie build tarmac now")
	(erc-send-message "sweetie: alias yunowork sl -nLines 10 tarmac-lander")
	(erc-send-message "sweetie: alias wassup status tarmac-lander")
	(erc-send-message "sweetie: alias hitit build tarmac now")
	(erc-send-message "sweetie: alias production-merge build landscape-hosted-production-merge now COMMIT=True TAG=")
	(erc-send-message "sweetie: alias staging-merge build landscape-hosted-staging-merge now COMMIT=True")
	(erc-send-message "sweetie: alias merge-back build merge-back now MERGE_BACK_COMMIT=True")
	(erc-send-message "sweetie: alias test-patch build sanitized-db-test now"))

(defun erc-cmd-SPARKLE (line)
  "Make the 'LINE' sparkle."
  (erc-send-message (concat "✨" line "✨")))



(provide 'tealeg-irc)
;;; tealeg-irc.el ends here

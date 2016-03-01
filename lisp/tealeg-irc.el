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
(require 'sauron)

(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(add-to-list 'erc-modules 'notifications)
(erc-update-modules)

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
	(let ((secret (plist-get (car (auth-source-search :host "irc.canonical.com")) :secret))
        (nick-secret (plist-get (car (auth-source-search :host "nickserv.canonical.com")) :secret)))
    (setq erc-nickserv-passwords (list (cons "Canonical" (funcall nick-secret))))
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
                                       "#tech"
                                       "#server"
                                       "#juju"
                                       "#maas"))))

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

(defun erc-cmd-SPARKLE (&rest line)
  "Make the 'LINE' sparkle."
  (erc-send-message (concat "✨sparkiegeek✨: " (string-join line " "))))

(defun erc-cmd-GAMMA (&rest line)
  "Send a LINE to gamma squad."
  (erc-send-message (concat "𝝲(ack, free🆓, ✨sparkiegeek✨‍): " (string-join line " "))))

(defun erc-cmd-BETA (&rest line)
  "Send a LINE to beta squad."
  (erc-send-message (concat "𝝱(‍free, BjornT, tribaal, danilo‍): " (string-join line " "))))

(defun erc-cmd-ALPHA (&rest line)
  "Send a LINE to alpha squad."
  (erc-send-message (concat "𝝰(‍blackboxsw, fcorrea, benji‍): " (string-join line " "))))

(defun erc-cmd-QA (&rest line)
  "Send a LINE to QA squad."
  (erc-send-message (concat "ቀ(‍andreas‍): " (string-join line " "))))


(defun erc-cmd-HANDBAG (recipient &rest line)
  "Handbags the RECIPIENT, then sends them LINE."
  (erc-send-message (concat (erc-compute-nick) " 👜→😱 " recipient " " (string-join line " "))))

(defun erc-cmd-PISTOL (recipient &rest line)
  "Pistol whips the RECIPIENT, then sends them LINE."
  (erc-send-message (concat (erc-compute-nick) " 🔫→😱 " recipient " " (string-join line " "))))


(defun erc-cmd-SLAP (recipient &rest line)
  "Slaps the RECIPIENT, then sends then LINE."
  (erc-send-message (concat "🖑→😱 " recipient " " (string-join line " "))))

(defun erc-cmd-FISTBUMP (recipient &rest line)
  "Slaps the RECIPIENT, then sends then LINE."
  (erc-send-message (concat "👊→👊 " recipient " " (string-join line " "))))


(defun erc-cmd-RUSSIANPLUSONE (recipient)
  "Say +1 to RECIPIENT in Russian."
  (erc-send-message (concat recipient ": плюс один.")))


(defun erc-cmd-PARK (branch &rest line)
  "Parks the BRANCH, then sends then LINE."
  (erc-send-message (concat "[" branch "] 🚗 ⇥ 🄿 " (string-join line " "))))


(setq sauron-hide-mode-line t)
(setq sauron-watch-nicks '("tealeg" "landscape-crew"))
(setq sauron-separate-frame nil)

;; (defun saruon-speak-erc (origin prio msg &optional props)
;;   (when (eq origin 'erc)
;;     (call-process-shell-command
;;      (concat "espeak " "\"ERC alert: "
;;              (replace-regexp-in-string "\\(tealeg\\)?@tealeg:" "" msg) "\"&")
;;      nil 0)))


;; (add-hook 'sauron-event-added-functions 'saruon-speak-erc)

;; Clears out annoying erc-track-mode stuff for when we don't care.
;; Useful for when ChanServ restarts :P
(defun reset-erc-track-mode ()
  (interactive)
  (setq erc-modified-channels-alist nil)
  (erc-modified-channels-update))

(defadvice erc-track-find-face (around erc-track-find-face-promote-query activate)
  (if (erc-query-buffer-p) 
      (setq ad-return-value (intern "erc-current-nick-face"))
    ad-do-it))

(defadvice erc-track-modified-channels (around erc-track-modified-channels-promote-query activate)
  (if (erc-query-buffer-p) (setq erc-track-priority-faces-only 'nil))
  ad-do-it
  (if (erc-query-buffer-p) (setq erc-track-priority-faces-only 'all)))

(setq erc-format-query-as-channel-p t
      erc-track-priority-faces-only 'all
      erc-track-faces-priority-list '(erc-error-face
                                      erc-current-nick-face
                                      erc-keyword-face
                                      erc-nick-msg-face
                                      erc-direct-msg-face
                                      erc-dangerous-host-face
                                      erc-notice-face
                                      erc-prompt-face))
(setq erc-current-nick-highlight-type 'nick)
(setq erc-keywords '("landscape-crew"))
 
(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK"
                                "MODE"))
(setq erc-track-use-faces t)
(setq erc-track-faces-priority-list
      '(erc-current-nick-face erc-keyword-face))
(setq erc-track-priority-faces-only 'all)

(provide 'tealeg-irc)
;;; tealeg-irc.el ends here

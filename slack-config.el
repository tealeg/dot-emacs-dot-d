(require 'slack)
(require 'alert)
(require 'oauth2)
(require 'notifications)

(setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
(setq slack-prefer-current-team t)

(slack-register-team
 :name "Avocet"
 :default t
 :client-id "2521581178.328467534052"
 :client-secret "136357788434c6f887307f3deef83868"
 :token "xoxp-2521581178-210266202484-329554844503-77924aa5b2202088265a6786d331fdec"
 :subscribed-channels '(general developers arrr ask-dev externals incidents operations remotes)
 :full-and-display-names t
 )
(define-key slack-info-mode-map "C-s u" 'slack-room-update-messages)
(define-key slack-mode-map "C-s k"    'slack-buffer-kill)
(define-key slack-mode-map "C-s r a" 'slack-message-add-reaction)
(define-key slack-mode-map "C-s r r" 'slack-message-remove-reaction)
(define-key slack-mode-map "C-s r s" 'slack-message-show-reaction-users)
(define-key slack-mode-map "C-s p l" 'slack-room-pins-list)
(define-key slack-mode-map "C-s p a" 'slack-message-pins-add)
(define-key slack-mode-map "C-s p r" 'slack-message-pins-remove)
(define-key slack-mode-map "C-s m m" 'slack-message-write-another-buffer)
(define-key slack-mode-map "C-s m e" 'slack-message-edit)
(define-key slack-mode-map "C-s m d" 'slack-message-delete)
(define-key slack-mode-map "C-s u " 'slack-room-update-messages)
(define-key slack-mode-map "C-s 2 " 'slack-message-embed-mention)
(define-key slack-mode-map "C-s 3 " 'slack-message-embed-channel)
(define-key slack-mode-map "C-s C-n" 'slack-buffer-goto-next-message)
(define-key slack-mode-map "C-s C-p" 'slack-buffer-goto-prev-message)


(define-key slack-edit-message-mode-map "C-s k " 'slack-message-cancel-edit)
(define-key slack-edit-message-mode-map "C-s s" 'slack-message-nsend-from-buffer)
(define-key slack-edit-message-mode-map "C-s 2" 'slack-message-embed-mention)
(define-key slack-edit-message-mode-map "C-s 3" 'slack-message-embed-channel)

(setq alert-default-style 'notifications)

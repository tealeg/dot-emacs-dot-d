;;; tealeg--mastodon -- Configure emacs to be a mastodon client
;;;
;;; Commentary:
;;;     ... because of reasons.
;;;
;;; Code:

(straight-use-package 'discover)
(straight-use-package 'emojify)
(straight-use-package 'mastodon)

(require 'mastodon-discover)
(with-eval-after-load 'mastodon (mastodon-discover))

(setq mastodon-instance-url "https://mastodon.online"
      mastodon-active-user "tealeg")

(provide 'tealeg--mastodon)
;;; tealeg--mastodon.el ends here

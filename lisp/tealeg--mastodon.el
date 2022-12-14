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
(require 'mastodon-alt-tl)
(with-eval-after-load 'mastodon (mastodon-discover))
(with-eval-after-load 'mastodon (mastodon-alt-tl-activate))

(setq mastodon-instance-url "https://mastodon.online"
      mastodon-active-user "tealeg")

(provide 'tealeg--mastodon)
;;; tealeg--mastodon.el ends here

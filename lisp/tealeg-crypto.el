;;; tealeg-crypto.el -- cryptographic configuration
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'pinentry)
(require 'epg)
(setq epg-gpg-program "gpg2")

(setenv "GPG_TTY" nil)
(setenv "GPG_AGENT_INFO" nil)

(setq epg-pinentry-mode 'ask)

(setq auth-source-debug t)
(setq auth-sources
      '((:source "~/.emacs.d/secrets/.authinfo.gpg")))

(pinentry-start)

(provide 'tealeg-crypto)
;;; tealeg-crypto.el ends here

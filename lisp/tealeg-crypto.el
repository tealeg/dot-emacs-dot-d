;;; tealeg-crypto --- my crypograhic settings.
;;;
;;; Commentary:
;;;     Cryptograhic setup

;;; Code:
(require 'epa-file)
(epa-file-enable)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; Secrets
(require 'secrets)
(setq secrets-enabled t)

(provide 'tealeg-crypto)
;;; tealeg-crypto.el ends here

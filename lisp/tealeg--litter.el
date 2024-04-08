(use-package no-littering)

(elpaca nil
  (require 'files)
  (setq backup-by-copying t      ; don't clobber symlinks
        backup-directory-alist '(("." . "~/.saves"))    ; don't litter my fs tree
        delete-old-versions t
        kept-new-versions 6
        kept-old-versions 2
        version-control t
        create-lockfiles nil
        )

  (let ((my-auto-save-dir (locate-user-emacs-file "auto-save")))
    (setq auto-save-file-name-transforms
          `((".*" ,(expand-file-name "\\2" my-auto-save-dir) t)))
    (unless (file-exists-p my-auto-save-dir)
      (make-directory my-auto-save-dir)))
  (setq auto-save-default t
        auto-save-timeout 10
        auto-save-interval 200)
  )

(provide 'tealeg--litter)

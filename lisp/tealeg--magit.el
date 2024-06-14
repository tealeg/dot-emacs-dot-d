(setq mail-host-address "gmail.com"
      user-mail-address "tealeg@gmail.com")


(defun +elpaca-unload-seq (e)
  (and (featurep 'seq) (unload-feature 'seq t))
  (elpaca--continue-build e))

(defun +elpaca-seq-build-steps ()
  (append (butlast (if (file-exists-p (expand-file-name "seq" elpaca-builds-directory))
                       elpaca--pre-built-steps elpaca-build-steps))
          (list '+elpaca-unload-seq 'elpaca--activate-package)))

(use-package seq :ensure `(seq :build ,(+elpaca-seq-build-steps)))

(use-package transient
  :after seq
  :ensure)

(use-package magit 
  :after transient
  :ensure t)


(provide 'tealeg--magit)

;;; tealeg-tex.el --- Setting for editing TeX and LaTeX files.
;;;
;;; Commentary:
;;; Code:

(load "auctex.el" nil t t)
(load "preview.el" nil t t)
(require 'reftex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode


(provide 'tealeg-tex)
;;; tealeg-tex.el ends here

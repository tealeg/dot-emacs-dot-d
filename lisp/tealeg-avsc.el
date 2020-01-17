;;; tealeg-avsc.el -- set up for editing avsc (Avro Schema) files
;;;
;;; Commentary:
;;;	Note that .avsc is the JSON avro schema format, as opposed to the avdl (IDL) file.
;;;
;;; Code:


(straight-use-package 'json-mode)

(add-to-list 'auto-mode-alist `("\\.avsc\\'" . json-mode))

(provide 'tealeg-avsc)
;;; tealeg-avsc.el ends here.

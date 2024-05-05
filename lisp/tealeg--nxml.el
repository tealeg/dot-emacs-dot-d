(defun tealeg--format-xml-buffer ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "><" nil t)
      (replace-match ">
<" nil nil))
    (indent-region (point-min) (point-max))
    )
  )


(defvar tealeg--xml-mode-keymap (make-keymap) "tealeg--xml-mode keymap.")
(define-key tealeg--xml-mode-keymap (kbd "C-M-y") 'tealeg--format-xml-buffer)

(define-minor-mode tealeg--xml-mode
  "Toggle tealeg--xml mode.
Interactively with no argument, this command toggles the mode.
A positive prefix argument enables the mode, any other prefix
argument disables it.  From Lisp, argument omitted or nil enables
the mode, `toggle' toggles the state."
  ;; Initial state
  :init-value nil
  ;; Indicator
  :lighter " ťX"
  ;; bindings
  :keymap  tealeg--xml-mode-keymap)



(defun tealeg--nxml-helper-f ()
  (tealeg--xml-mode 1))

(add-hook 'nxml-mode-hook #'tealeg--nxml-helper-f)


(provide 'tealeg--nxml)

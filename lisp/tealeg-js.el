;;; tealeg-js --- my js settings.
;;;
;;; Commentary:
;;;     Js setup

;;; Code:
(require 'highlight-parentheses)
(require 'js2-mode)


(defun find-js-files-below-root (root)
  "Return a list of the paths to all files with the .js extension below a ROOT directory"
  (directory-files-recursively root "^.*\.js$"))


(defun indent-js-files (root)
  "Reindent all JS files below a ROOT directory."
  (dolist (js-file (find-js-files-below-root root))
    (save-excursion
      (with-current-buffer (find-file-noselect js-file t)
        (indent-region (point-min) (point-max))
        (save-buffer 0)
        (kill-buffer (current-buffer))))))


(defun unquote-json-keys ()
  "Unqote JSON keys in the region."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\"\\(.*\\)\":" nil t)
      (replace-match "\\1:"))))

(defun wrap-and-break-string ()
  "Spread the string at point over multiple lines."
  (interactive)
  (indent-according-to-mode)
  (if (= 76 (move-to-column 76))
      (progn
        (while (not (eq (get-char-code-property (char-after) 'general-category) 'Zs))
          (backward-char))
        (insert "\" +\n\""))))

(defun js-helpers ()
  "Setup 'jsf-mode'."
  (setq show-trailing-whitespace t)
	(highlight-parentheses-mode 1)
	(show-paren-mode t)
  (set-fill-column 79)
  (visual-line-mode 1)
  ()
  (define-key js-mode-map [remap fill-paragraph] 'wrap-and-break-string)
  )
 
(add-hook 'js-mode-hook 'js-helpers)
(add-hook 'javascript-mode-hook 'js-helpers)
(add-hook 'js2-mode-hook 'js-helpers)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))


(provide 'tealeg-js)
;;; tealeg-js.el ends here

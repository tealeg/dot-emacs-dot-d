;;; tealeg-appearance.el -- Configuration visual aspects of emacs
;;;
;;; Commentary:
;;;
;;; Code:

(straight-use-package 'grayscale-theme)
(straight-use-package 'brutalist-theme)
(straight-use-package 'green-is-the-new-black-theme)
;;(straight-use-package 'tron-legacy-theme)
(straight-use-package 'doom-modeline)

(setq-default font-use-system-font nil
	      tron-legacy-theme-dark-fg-bright-comments t
	      tron-legacy-theme-vivid-cursor t)


(when (display-graphic-p)
  (window-divider-mode -1)
  (if (eq system-type 'darwin)
      (progn
	(set-frame-font "IBM Plex Mono-15")
	(set-face-font 'default "IBM Plex Mono-15")
	(set-face-font 'variable-pitch "IBM Plex Mono-15")
	(set-face-font 'fixed-pitch "IBM Plex Mono-15")
	(set-face-font 'fixed-pitch-serif "IBM Plex Mono-15")
	(setq-default line-spacing 0.3))
    (progn
      (set-frame-font "IBM Plex Mono-10")
      (set-face-font 'default "IBM Plex Mono-10")
      (set-face-font 'variable-pitch "IBM Plex Sans-10")
      (set-face-font 'fixed-pitch "IBM Plex Mono-10")
      (set-face-font 'fixed-pitch-serif "IBM Plex Mono-10")
      )
    )
  )


 (setq display-time-string-forms
       '((concat " " 24-hours ":" minutes " ")))


(load-theme 'green-is-the-new-black t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
(global-linum-mode -1)
(display-battery-mode 1)
(display-time-mode 1)
(doom-modeline-mode 1)

(if (boundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(if (boundp 'fringe-mode)
    (fringe-mode 30))


(setq header-line-format
      '(:eval
        (concat (and (display-graphic-p)
                     (concat " "  ;; fringe
                             (and (eq 'left (frame-parameter nil 'vertical-scroll-bars))
                                  "  ")))  ;; left scrollbar
                "some header text")))


(defun with-face (str &rest face-plist)
  (propertize str 'face face-plist))

(defun sl/make-header ()
  ""
  (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
         (sl/header (file-name-directory sl/full-header))
         (sl/drop-str "[...]"))
    (if (> (length sl/full-header)
           (window-body-width))
        (if (> (length sl/header)
               (window-body-width))
            (progn
              (concat (with-face sl/drop-str
                        :background "blue"
                        :weight 'bold
                        )
                      (with-face (substring sl/header
                                            (+ (- (length sl/header)
                                                  (window-body-width))
                                               (length sl/drop-str))
                                            (length sl/header))
                        ;; :background "red"
                        :weight 'bold
                        )))
          (concat (with-face sl/header
                    ;; :background "red"
                    :foreground "#8fb28f"
                    :weight 'bold
                    )))
      (concat (with-face sl/header
                ;; :background "green"
                ;; :foreground "black"
                :weight 'bold
                :foreground "#8fb28f"
                )
              (with-face (file-name-nondirectory buffer-file-name)
                :weight 'bold
                ;; :background "red"
                )))))
(defun sl/display-header ()
  (setq header-line-format
        '("" ;; invocation-name
          (:eval (if (buffer-file-name)
                     (sl/make-header)
                   "%b")))))
(add-hook 'buffer-list-update-hook
          'sl/display-header)

(provide 'tealeg-appearance)
;;; tealeg-appearance.el ends here.

;;; tealeg-vc --- my vc settings.
;;;
;;; Commentary:
;;;     Vc setup


;;; Code:
(let ((git-el-dir "/usr/share/git-core/emacs"))
	(if (file-exists-p git-el-dir)
			(progn
				(add-to-list 'load-path git-el-dir)
				(require 'git)
				(require 'git-blame)
				(global-set-key (kbd "C-x v =") 'git-status))))

(require 'magit)
(require 'git-gutter)
(require 'github-notifier)

(custom-set-variables '(github-notifier-token "5adb2a6d757eaaac24dd78e7acdd43f3aa7bcf0b")
                      '(github-notifier-only-participating t)
                      )

(require 'alert)
(custom-set-variables '(alert-default-style 'osx-notifier))

(add-hook 'github-notifier-update-hook
          (lambda (some-json)
            (let (count (length (json-read-from-string some-json)))
              (when (> count 0)
                (alert (concat "There are " (number-to-string count) " unread notifications on GitHub"))))))



(set-face-attribute 'git-gutter:added nil :inherit 'fringe)
(set-face-attribute 'git-gutter:deleted nil :inherit 'fringe)
(set-face-attribute 'git-gutter:modified nil :inherit 'fringe)
(set-face-attribute 'git-gutter:separator nil :inherit 'fringe)
(set-face-attribute 'git-gutter:unchanged nil :inherit 'fringe)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; Use git-gutter for 'git', 'mercurial' and 'bazaar' project.
(custom-set-variables
 '(git-gutter:handled-backends '(git hg bzr)))

;; If you would like to use git-gutter.el and linum-mode
;; (git-gutter:linum-setup)

;; If you enable git-gutter-mode for some modes
;; (add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

(global-set-key (kbd "C-x g") 'magit-status)



(provide 'tealeg-vc)
;;; tealeg-vc.el ends here

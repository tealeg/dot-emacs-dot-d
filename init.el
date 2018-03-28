(require 'package)
;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)


		
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(load-file "~/.emacs.d/org.elc")
(load-file "~/.emacs.d/appearance.elc")
(load-file "~/.emacs.d/versioning.elc")
(load-file "~/.emacs.d/go-config.elc")
(load-file "~/.emacs.d/eshell-config.elc")
(load-file "~/.emacs.d/slack-config.elc")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#231e18" "#d35c5c" "#b7ba53" "#e0ac16" "#88a4d3" "#bb90e2" "#88a4d3" "#cabcb1"])
 '(ansi-term-color-vector
   [unspecified "#231e18" "#d35c5c" "#b7ba53" "#e0ac16" "#88a4d3" "#bb90e2" "#88a4d3" "#cabcb1"] t)
 '(custom-safe-themes
   '("cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "146061a7ceea4ccc75d975a3bb41432382f656c50b9989c7dc1a7bb6952f6eb4" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "446cc97923e30dec43f10573ac085e384975d8a0c55159464ea6ef001f4a16ba" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" default))
 '(package-selected-packages
   '(rust-mode minimal-theme slack ess scad-preview scad-mode flycheck-gometalinter godoctor go-guru go-eldoc go-complete go-mode magit base16-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

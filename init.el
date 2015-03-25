;;; Package --- Summary
;;;
;;; Persontal emacs settings.

;;; Commentary:
;;;
;;; Everything I need to make Emacs feel like home!

;;; Code:
(add-to-list 'load-path "/home/tealeg/.emacs.d/lisp")

(require 'tealeg-packages)
(require 'tealeg-autocompile)
(require 'tealeg-backups)
(require 'tealeg-crypto)
(require 'tealeg-frame)
(require 'tealeg-font)
(require 'tealeg-theme)
(require 'tealeg-file)
(require 'tealeg-unicode)
(require 'tealeg-spelling)
(require 'tealeg-shell)
(require 'tealeg-check) ;; Needs flycheck
(require 'tealeg-landscape)
(require 'tealeg-vc) ;; Needs DVC, which seems to break emacs daemon right now.
(require 'tealeg-calendar)
(require 'tealeg-elisp)
(require 'tealeg-go) ;; Needs go-mode
(require 'tealeg-xml)
(require 'tealeg-org) ;; Needs org-page
(require 'tealeg-irc)
(require 'tealeg-python)

(require 'tealeg-automode)
(require 'tealeg-keybindings)

;; (server-start t)
;; (provide 'init)
;; ;;; init.el ends here

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector
;; 	 ["#151515" "#953331" "#546a29" "#909737" "#385e6b" "#7f355e" "#34676f" "#c6a57b"])
;;  '(background-color "#202020")
;;  '(background-mode dark)
;;  '(cursor-color "#cccccc")
;;  '(custom-safe-themes
;; 	 (quote
;; 		("2a12e95e9ee6ed57592e7df12f3f028205575e9b3affdb5e6fa589421c618136" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "885ef8634f55df1fa067838330e3aa24d97be9b48c30eadd533fde4972543b55" "b9183de9666c3a16a7ffa7faaa8e9941b8d0ab50f9aaba1ca49f2f3aec7e3be9" "ad6db94e21962ae96fc834e71b6763dc8cdf9b3798117b70b2bb7b91e628ac34" "0c97dcff4ea6ac23af383e6153723a712c1de3a4b427e97d1e473504dbc2fe06" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "c87cc60d01cf755375759d165c1d60d9586c6a31f0b5437a0378c2a93cfc8407" "a5beb9b1d6dc23dd8a3c204c159c9a5f1e0115ff14b5b8579d6f3ede4f3b3aee" "26247bcb0b272ec9a5667a6b854125450c88a44248123a03d9f242fd5c6ec36f" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" default)))
;;  '(fci-rule-color "gray80" t)
;;  '(foreground-color "#cccccc")
;;  '(highlight-symbol-colors
;; 	 (quote
;; 		("#EFFF00" "#73CD4F" "#83DDFF" "MediumPurple1" "#66CDAA" "DarkOrange" "HotPink1" "#809FFF" "#ADFF2F")))
;;  '(hl-paren-background-colors
;; 	 (quote
;; 		("#00FF99" "#CCFF99" "#FFCC99" "#FF9999" "#FF99CC" "#CC99FF" "#9999FF" "#99CCFF" "#99FFCC" "#7FFF00")))
;;  '(hl-paren-colors (quote ("#326B6B")))
;;  '(vc-annotate-background "#2B2B2B")
;;  '(vc-annotate-color-map
;; 	 (quote
;; 		((20 . "#dc322f")
;; 		 (40 . "#d01A4E")
;; 		 (60 . "#cb4b16")
;; 		 (80 . "#b58900")
;; 		 (100 . "#b58900")
;; 		 (120 . "#b58900")
;; 		 (140 . "#7E7D7E")
;; 		 (160 . "#7E7D7E")
;; 		 (180 . "#9FAA9B")
;; 		 (200 . "#9FC59F")
;; 		 (220 . "#859900")
;; 		 (240 . "#31be67")
;; 		 (260 . "#2aa198")
;; 		 (280 . "#268bd2")
;; 		 (300 . "#268bd2")
;; 		 (320 . "#268bd2")
;; 		 (340 . "#00a74e")
;; 		 (360 . "#d33682"))))
;;  '(vc-annotate-very-old-color "#d33682"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:background nil)))))
;; (put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 [("#181818" . "#282828")
		("#ab4642" . "#dc9656")
		("#a1b56c" . "#383838")
		("#f7ca88" . "#383838")
		("#7cafc2" . "#585858")
		("#ba8baf" . "#b8b8b8")
		("#86c1b9" . "#d8d8d8")
		("#f8f8f8" . "#e8e8e8")])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
	 (quote
		("a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "b9183de9666c3a16a7ffa7faaa8e9941b8d0ab50f9aaba1ca49f2f3aec7e3be9" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "930a202ae41cb4417a89bc3a6f969ebb7fcea5ffa9df6e7313df4f7a2a631434" "024b0033a950d6a40bbbf2b1604075e6c457d40de0b52debe3ae994f88c09a4a" "c56d90af9285708041991bbc780a073182cbe91721de17c6e7a8aac1380336b3" "0ed983facae99849805b2f7be926561cb58474eb18e5296d9bb3ad7f9b088a5b" "c537bf460334a1eca099e05a662699415f3971b438972bed499c5efeb821086b" "2a86b339554590eb681ecf866b64ce4814d58e6d093966b1bf5a184acf78874d" "8f1cedf54f137f71382e3367e1843d10e173add99abe3a5f7d3285f5cc18f1a9" "e3c90203acbde2cf8016c6ba3f9c5300c97ddc63fcb78d84ca0a144d402eedc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "a750b2b1ab7e1618e3f8c34817e3f4fa631524dad899a6967eb59b6651446585" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "3a91205cfbbe87a78889e7871000b73e89783dde76550dc32fd6d379a1fe70da" "61cdbf9f952008a71fad6b38c7605d8673d1db7f5fd47973d6d379ab3f9076dc" "8022cea21aa4daca569aee5c1b875fbb3f3248a5debc6fc8cf5833f2936fbb22" "a0fdc9976885513b03b000b57ddde04621d94c3a08f3042d1f6e2dbc336d25c7" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "e4bc8563d7651b2fed20402fe37b7ab7cb72869f92a3e705907aaecc706117b5" "18e89f93cbaaac214202142d910582354d36639f21f32b04718ca6425dbc82a2" "3d003561784526d83d1dd187aecf4799c72af27046bc3aa2f6d95c64e5ee4746" "d809ca3cef02087b48f3f94279b86feca896f544ae4a82b523fba823206b6040" "fa942713c74b5ad27893e72ed8dccf791c9d39e5e7336e52d76e7125bfa51d4c" "456ac8176c7c01680384356cbdc568a7683d1bada9c83ae3d7294809ddda4014" "03ec0a33794a2f1b74103e5d63b1646ddb2a0cf38b3b447df6d6e6ba68c5b3af" "7b7ef508f9241c01edaaff3e0d6f03588a6f4fddb1407a995a7a333b29e327b5" "f15a7ce08b9e13553c1f230678e9ceb5b372f8da26c9fb815eb20df3492253b7" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
	 (quote
		(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(ensime-sem-high-faces
	 (quote
		((var :foreground "#9876aa" :underline
					(:style wave :color "yellow"))
		 (val :foreground "#9876aa")
		 (varField :slant italic)
		 (valField :foreground "#9876aa" :slant italic)
		 (functionCall :foreground "#a9b7c6")
		 (operator :foreground "#cc7832")
		 (param :foreground "#a9b7c6")
		 (class :foreground "#4e807d")
		 (trait :foreground "#4e807d" :slant italic)
		 (object :foreground "#6897bb" :slant italic)
		 (package :foreground "#cc7832"))))
 '(fci-rule-color "#f1c40f" t)
 '(fringe-mode 10 nil (fringe))
 '(git-gutter:handled-backends (quote (git hg bzr)))
 '(gnus-logo-colors (quote ("#259ea2" "#adadad")) t)
 '(gnus-mode-line-image-cache
	 (quote
		(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
	 (--map
		(solarized-color-blend it "#fdf6e3" 0.25)
		(quote
		 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
	 (quote
		(("#eee8d5" . 0)
		 ("#B4C342" . 20)
		 ("#69CABF" . 30)
		 ("#69B7F0" . 50)
		 ("#DEB542" . 60)
		 ("#F2804F" . 70)
		 ("#F771AC" . 85)
		 ("#eee8d5" . 100))))
 '(hl-bg-colors
	 (quote
		("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
	 (quote
		("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(linum-format " %6d ")
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(package-selected-packages
	 (quote
		(dash-functional neotree flycheck-pyflakes git-gutter yafolding alect-themes e2ansi light-soap-theme minimal-theme racket-mode markdown-mode solarized-theme hemisu-theme flatui-theme slime org-page go-mode flycheck fancy-battery erc-social-graph distinguished-theme display-theme deep-thought-theme dark-krystal-theme darcula-theme column-enforce-mode colonoscopy-theme clues-theme cloud-to-butt-erc bubbleberry-theme boxquote boron-theme basic-theme base16-theme badger-theme artbollocks-mode 2048-game)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#f8f8f8")
 '(vc-annotate-color-map
	 (quote
		((20 . "#ab4642")
		 (50 . "#dc9656")
		 (80 . "#f7ca88")
		 (110 . "#a1b56c")
		 (140 . "#86c1b9")
		 (170 . "#7cafc2")
		 (200 . "#ba8baf")
		 (230 . "#a16046")
		 (260 . "#181818")
		 (290 . "#282828")
		 (320 . "#383838")
		 (350 . "#585858"))))
 '(vc-annotate-very-old-color "#585858")
 '(weechat-color-list
	 (quote
		(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(when (not (facep (aref ansi-term-color-vector 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

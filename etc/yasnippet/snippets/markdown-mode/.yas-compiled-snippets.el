;;; Compiled snippets and support files for `markdown-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'markdown-mode
                     '(("dsub" "{% include \"_partials/substep.md\" path: \"$1\", title: \"$2\", text: \"`yas-selected-text`$3\" %}\n$0\n\n\n\n" "doctave-substep" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/substep" nil nil)
                       ("dstep" "{% include \"_partials/step.md\" id: \"$1\", number: \"→$2\", depth: $3, title: \"$4\", path: \"$5\", body: $6 %}$0\n\n" "doctave-step" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/step" nil nil)
                       ("dseq" "{% include \"_partials/sequential.md\" prev: \"$1\", prevtitle: \"$2\", next: \"$3\", nexttitle: \"$4\" %}$0" "doctave-sequential" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/sequential" nil nil)
                       ("dpre" "{% include \"_partials/prerequisite.md\" title: \"$1\", body: $2 %}\n$0\n" "doctave-prerequisite" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/prerequisite" nil nil)
                       ("dmul" "{% include \"_partials/multi-step.md\" logo: \"$1\", title: \"$2\", intro: $3, steps: $4, outro: $5, depth: $6, id: \"$7\" %}$0 \n" "doctave-multistep" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/multistep" nil nil)
                       ("dmod" "{% if DOCTAVE.user_preferences.operating_model == \"$1\" %}\n`yas-selected-text`\n{% endif %}\n$0" "doctave-model" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/model" nil nil)
                       ("dcomp" "{% include \"_partials/complete.md\" id: \"$1\", title: \"$2\", depth: $3, body: $4 %}$0\n" "Doctave complete" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/complete" nil nil)
                       ("dcap" "{% capture $1 %}\n`yas-selected-text`\n{% endcapture %}$0\n" "doctave-capture" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/capture" nil nil)
                       ("dale" "{% include \"_partials/alert.md\" class: \"$1\", title: \"$2\", text: \"`yas-selected-text`$3\"%}$0" "doctave-alert" nil nil nil "/Users/geoffrey/.config/emacs/etc/yasnippet/snippets/markdown-mode/alert" nil nil)))


;;; Do not edit! File generated at Wed May 29 14:34:09 2024

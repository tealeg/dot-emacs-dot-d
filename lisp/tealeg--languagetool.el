(use-package langtool
  :init
  (setq langtool-java-user-arguments '("-Dfile.encoding=UTF-8"))
  (setq langtool-default-language "en-GB")
  (setq langtool-java-bin "/usr/bin/java")
  (setq langtool-bin "/opt/homebrew/Cellar/languagetool/6.3/bin/languagetool")
  (setq langtool-java-classpath
        "/opt/homebrew/Cellar/languagetool/6.3/libexec/")
  :config
  (global-set-key "\C-x4w" 'langtool-check)
  (global-set-key "\C-x4W" 'langtool-check-done)
  (global-set-key "\C-x4l" 'langtool-switch-default-language)
  (global-set-key "\C-x44" 'langtool-show-message-at-point)
  (global-set-key "\C-x4c" 'langtool-interactive-correction)
  )


;; (use-package languagetool
;;   :ensure t
;;   :defer t
;;   :commands (languagetool-check
;;              languagetool-clear-suggestions
;;              languagetool-correct-at-point
;;              languagetool-correct-buffer
;;              languagetool-set-language
;;              languagetool-server-mode
;;              languagetool-server-start
;;              languagetool-server-stop)
;;   :config
;;   (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8")
;;         languagetool-console-command "/opt/homebrew/Cellar/languagetool/6.3/libexec/languagetool-commandline.jar"
;;         languagetool-server-command "/opt/homebrew/Cellar/languagetool/6.3/libexec/languagetool-server.jar"))
  
  ;; (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8"
  ;;                                     "-cp"
  ;;                                     "/opt/homebrew/Cellar/languagetool/6.3/libexec/")
  ;;       languagetool-console-command "org.languagetool.commandline.Main"
  ;;       languagetool-server-command "org.languagetool.server.HTTPServer"))

;; Paid use only
;; (setq languagetool-api-key "xxxxxxxxxxxx"
;;       languagetool-username "johndoe@example.com")
  

(provide 'tealeg--languagetool)

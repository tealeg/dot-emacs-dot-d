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


(provide 'tealeg--languagetool)

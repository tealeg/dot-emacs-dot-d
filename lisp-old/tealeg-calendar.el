;;; tealeg-calendar --- my calendar settings.
;;;
;;; Commentary:
;;;     Calendar setup

;;; Code:

(setq holiday-solar-holidays nil)
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-oriental-holidays nil)
(setq holiday-christian-holidays nil)

(require 'calendar)
(require 'solar)

(setq calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (") time-zone (if time-zone ")")))

(setq calendar-location-name "Hannover, Germany")
(setq calendar-latitude 52.388227)
(setq calendar-longitude  9.655909)

(provide 'tealeg-calendar)
;;; tealeg-calendar.el ends here

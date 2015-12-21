;; gnus configuration

(require 'gnus)

;; madrognon
(setq gnus-select-method '(nnimap "madrognon"
				  (nnimap-address "madrognon.net")
				  (nnimap-server-port 143)
				  (nnimap-stream starttls)))

(setq smtpmail-smtp-server "madrognon.net"
      smtpmail-default-smtp-server "madrognon.net"
      send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      user-full-name "Nicolas Herry"
      mail-host-address "madrognon.net"
      gnus-message-archive-group (format-time-string "nnimap+madrognon:Sent")
      gnus-gcc-mark-as-read t)

;; gnus configuration

(require 'gnus)
(require 'nnir)

;; usenet
(setq gnus-select-method '(nntp "news.gmane.org"))

(add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))

(setq gnus-use-correct-string-widths nil)

(setq user-full-name "Nicolas Herry"
      user-mail-address "beastieboy@beastieboy.net")

;; email - beastieboy.net / gandi

(add-to-list  'gnus-secondary-select-methods '(nnimap "beastieboy"
				  (nnimap-address "imap.beastieboy.net")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)
				  (nnimap-inbox "INBOX")
;;				  (nnimap-split-methods default)
				  ))
(setq smtpmail-smtp-server "smtp.beastieboy.net"
      smtpmail-default-smtp-server "smtp.beastieboy.net"
      send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      user-full-name "Nicolas Herry"
      mail-host-address "beastieboy.net"
;;      mml2015-signers '("16924EF0")
;;      mml2015-encrypt-to-self t
      gnus-message-archive-group (format-time-string "nnimap+beastieboy:Sent")
      gnus-gcc-mark-as-read t
      user-login-name "beastieboy@beastieboy.net")


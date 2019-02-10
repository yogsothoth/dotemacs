;; gnus configuration

(require 'gnus)
(require 'nnir)

;; usenet
(setq gnus-use-correct-string-widths nil)

(setq user-full-name "Nicolas Herry"
      user-mail-address "beastieboy@beastieboy.net")

;; email - beastieboy.net / gandi
(setq gnus-select-method '(nnimap "beastieboy"
				  (nnimap-address "imap.beastieboy.net")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)
				  (nnimap-inbox "INBOX")
				  (nnimap-split-methods default)
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

;; splitting
(setq nnimap-split-inbox "INBOX")
(setq nnmail-split-methods
 '(("INBOX.freebsd-questions" "^To:.*freebsd-questions@freebsd.org")
   ("INBOX.freebsd-questions" "^To:.*questions@freebsd.org")
   ("INBOX.freebsd-questions" "^Cc:.*freebsd-questions@freebsd.org")
   ("INBOX.freebsd-questions" "^Cc:.*questions@freebsd.org")
   ("INBOX.freebsd-amd64" "^To:.*freebsd-amd64@freebsd.org")
   ("INBOX.freebsd-amd64" "^To:.*amd64@freebsd.org")
   ("INBOX.freebsd-amd64" "^Cc:.*freebsd-amd64@freebsd.org")
   ("INBOX.freebsd-amd64" "^Cc:.*amd64@freebsd.org")
   ("INBOX.freebsd-hackers" "^To:.*freebsd-hackers@freebsd.org")
   ("INBOX.freebsd-hackers" "^To:.*hackers@freebsd.org")
   ("INBOX.freebsd-hackers" "^Cc:.*freebsd-hackers@freebsd.org")
   ("INBOX.freebsd-hackers" "^Cc:.*hackers@freebsd.org")
   ("INBOX.freebsd-current" "^To:.*freebsd-current@freebsd.org")
   ("INBOX.freebsd-current" "^To:.*current@freebsd.org")
   ("INBOX.freebsd-current" "^Cc:.*freebsd-current@freebsd.org")
   ("INBOX.freebsd-current" "^Cc:.*current@freebsd.org")
   ("INBOX.freebsd-stable" "^To:.*freebsd-stable@freebsd.org")
   ("INBOX.freebsd-stable" "^To:.*stable@freebsd.org")
   ("INBOX.freebsd-stable" "^Cc:.*freebsd-stable@freebsd.org")
   ("INBOX.freebsd-stable" "^Cc:.*stable@freebsd.org")
   ("INBOX.freebsd-bugs" "^To:.*freebsd-bugs@freebsd.org")
   ("INBOX.freebsd-bugs" "^To:.*bugs@freebsd.org")
   ("INBOX.freebsd-bugs" "^Cc:.*freebsd-bugs@freebsd.org")
   ("INBOX.freebsd-bugs" "^Cc:.*bugs@freebsd.org")
   ("INBOX.freebsd-advocacy" "^To:.*freebsd-advocacy@freebsd.org")
   ("INBOX.freebsd-advocacy" "^To:.*advocacy@freebsd.org")
   ("INBOX.freebsd-advocacy" "^Cc:.*freebsd-advocacy@freebsd.org")
   ("INBOX.freebsd-advocacy" "^Cc:.*advocacy@freebsd.org")
   ("INBOX.freebsd-embedded" "^To:.*freebsd-embedded@freebsd.org")
   ("INBOX.freebsd-embedded" "^To:.*embedded@freebsd.org")
   ("INBOX.freebsd-embedded" "^Cc:.*freebsd-embedded@freebsd.org")
   ("INBOX.freebsd-embedded" "^Cc:.*embedded@freebsd.org")
   ("INBOX.freebsd-arm" "^To:.*freebsd-arm@freebsd.org")
   ("INBOX.freebsd-arm" "^To:.*arm@freebsd.org")
   ("INBOX.freebsd-arm" "^Cc:.*freebsd-arm@freebsd.org")
   ("INBOX.freebsd-arm" "^Cc:.*arm@freebsd.org")
   ("INBOX.freebsd-ports-announce" "^To:.*freebsd-ports-announce@freebsd.org")
   ("INBOX.freebsd-ports-announce" "^To:.*ports-announce@freebsd.org")
   ("INBOX.freebsd-ports-announce" "^Cc:.*freebsd-ports-announce@freebsd.org")
   ("INBOX.freebsd-ports-announce" "^Cc:.*ports-announce@freebsd.org")
   ("INBOX.stumpwm" "^To:.*stumpwm-devel@nongnu.org")
   ("INBOX.stumpwm" "^Cc:.*stumpwm-devel@nongnu.org")
   ("INBOX.yesql" "^To:.*yesql@noreply.github.com")
   ("INBOX.yesql" "^Cc:.*yesql@noreply.github.com")
   ("INBOX" "")))

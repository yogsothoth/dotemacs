;; gnus configuration

(require 'gnus)

;; madrognon
(setq gnus-select-method '(nnimap "madrognon"
				  (nnimap-address "madrognon.net")
				  (nnimap-server-port 143)
				  (nnimap-stream starttls)
				  (nnimap-inbox "INBOX")
				  (nnimap-split-methods default)))

(setq smtpmail-smtp-server "madrognon.net"
      smtpmail-default-smtp-server "madrognon.net"
      send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      user-full-name "Nicolas Herry"
      mail-host-address "madrognon.net"
      mml2015-signers '("16924EF0")
      mml2015-encrypt-to-self t
      gnus-message-archive-group (format-time-string "nnimap+madrognon:Sent")
      gnus-gcc-mark-as-read t
      user-login-name "kafka")

;; splitting
(setq nnimap-split-inbox "INBOX")
(setq nnmail-split-methods
 '(("INBOX.clojure" "^To:.*clojure@googlegroups.com")
   ("INBOX.clojure" "^Cc:.*clojure@googlegroups.com")
   ("INBOX.pg-general" "^To:.*pgsql-general@postgresql.org")
   ("INBOX.pg-general" "^Cc:.*pgsql-general@postgresql.org")
   ("INBOX.pg-general" "^cc:.*pgsql-general@postgresql.org")
   ("INBOX.pg-hackers" "^To:.*pgsql-hackers@postgresql.org")
   ("INBOX.pg-hackers" "^Cc:.*pgsql-hackers@postgresql.org")
   ("INBOX.pg-admin" "^To:.*pgsql-admin@postgresql.org")
   ("INBOX.pg-admin" "^Cc:.*pgsql-admin@postgresql.org")
   ("INBOX.pg-fr" "^To:.*pgsql-fr-generale@postgresql.org")
   ("INBOX.pg-fr" "^Cc:.*pgsql-fr-generale@postgresql.org")
   ("INBOX.pg-announce" "^To:.*pgsql-announce@postgresql.org")
   ("INBOX.pg-announce" "^Cc:.*pgsql-announce@postgresql.org")
   ("INBOX.pg-performance" "^To:.*pgsql-performance@postgresql.org")
   ("INBOX.pg-performance" "^Cc:.*pgsql-performance@postgresql.org")
   ("INBOX.pg-novice" "^To:.*pgsql-novice@postgresql.org")
   ("INBOX.pg-novice" "^Cc:.*pgsql-novice@postgresql.org")
   ("INBOX.pg-advocacy" "^To:.*pgsql-advocacy@postgresql.org")
   ("INBOX.pg-advocacy" "^Cc:.*pgsql-advocacy@postgresql.org")
   ("INBOX.pg-jobs" "^To:.*pgsql-jobs@postgresql.org")
   ("INBOX.pg-jobs" "^Cc:.*pgsql-jobs@postgresql.org")
   ("INBOX.emacs-help" "^To:.*help-gnu-emacs@gnu.org")
   ("INBOX.pg-sql" "^To:.*pgsql-sql@postgresql.org")
   ("INBOX.pg-sql" "^Cc:.*pgsql-sql@postgresql.org")
   ("INBOX.emacs-help" "^Cc:.*help-gnu-emacs@gnu.org")
   ("INBOX.r-help" "^To:.*r-help@r-project.org")
   ("INBOX.r-help" "^Cc:.*r-help@r-project.org")
   ("INBOX.r-help" "^To:.*r-help@stat.math.ethz.ch")
   ("INBOX.r-help" "^Cc:.*r-help@stat.math.ethz.ch")
   ("INBOX.r-devel" "^To:.*r-devel@r-project.org")
   ("INBOX.r-devel" "^Cc:.*r-devel@r-project.org")
   ("INBOX.r-devel" "^To:.*r-devel@stat.math.ethz.ch")
   ("INBOX.r-devel" "^Cc:.*r-devel@stat.math.ethz.ch")
   ("INBOX.r-packages" "^To:.*r-packages@r-project.org")
   ("INBOX.r-packages" "^Cc:.*r-packages@r-project.org")
   ("INBOX.r-announce" "^To:.*r-announce@r-project.org")
   ("INBOX.r-announce" "^Cc:.*r-announce@r-project.org")
   ("INBOX.freebsd-questions" "^To:.*freebsd-questions@freebsd.org")
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
   ("INBOX.stumpwm" "^To:.*stumpwm-devel@nongnu.org")
   ("INBOX.stumpwm" "^Cc:.*stumpwm-devel@nongnu.org")
   ("INBOX.yesql" "^To:.*yesql@noreply.github.com")
   ("INBOX.yesql" "^Cc:.*yesql@noreply.github.com")
   ("INBOX.ratpoison-devel" "^To:.*ratpoison-devel@nongnu.org")
   ("INBOX.ratpoison-devel" "^Cc:.*ratpoison-devel@nongnu.org")
   ("INBOX" "")))


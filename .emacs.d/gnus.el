;; gnus configuration

;; gmail

(require 'gnus)
(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port "imaps")
                                  (nnimap-stream ssl)))

(add-to-list 'gnus-secondary-select-methods '(nnimap "madrognon"
						     (nnimap-address "ns300827.ip-91-121-66.eu")
						     (nnimap-server-port 143)
						     (nnimap-stream ssl)))



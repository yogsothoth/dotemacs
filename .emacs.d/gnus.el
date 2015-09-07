;; gnus configuration

(require 'gnus)

;; Windows config taken from
;; http://חנוך.se/diary/how_to_enable_GnuTLS_for_Emacs_24_on_Windows/index.en.html
;; certs for Windows taken from http://curl.haxx.se/docs/caextract.html

;; gmail

(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port "imaps")
                                  (nnimap-stream ssl)))

;; madrognon

;; (add-to-list 'gnus-secondary-select-methods '(nnimap "madrognon"
;; 						     (nnimap-address "ns300827.ip-91-121-66.eu")
;; 						     (nnimap-server-port 143)
;; 						     (nnimap-stream ssl)))


;(add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))
;(add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))


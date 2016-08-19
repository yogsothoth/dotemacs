;; BBDB configuration for gnus
(add-to-list 'load-path "~/.emacs.d/floating/bbdb/lisp")
(require 'bbdb)

(bbdb-initialize 'gnus 'message)
(bbdb-insinuate-message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(setq bbdb-send-mail-style 'gnus)
(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)
(setq bbdb-offer-save 1)
(setq bbdb-use-pop-up t)
(setq bbdb-electric-p t)
(setq bbdb-pop-up-target-lines 1)
(setq bbdb-north-american-phone-numbers nil)
(setq bbdb-default-country "France")

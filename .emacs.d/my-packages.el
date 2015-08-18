;; my-packages.el
;; install packages automatically
;; if they're not installed already

(defun kafka-install-package (package-name)
  (unless (package-installed-p package-name)
    (package-install package-name)))

(setq my-packages '(anti-zenburn-theme
		    auctex
		    cider
		    clojure-mode
		    clojure-mode-extra-font-locking
		    cmake-project
		    company
		    company-go
		    company-statistics
		    company-web
		    cperl-mode
		    dash
		    ess
		    js2-mode
		    js3-mode
		    paredit
		    simple-httpd
		    skewer-less
		    skewer-mode
		    web-completion-data
		    yasnippet
		    zenburn-theme		    
		    ))

(mapc 'kafka-install-package my-packages)

;; my-packages.el
;; install packages automatically
;; if they're not installed already

;; Packages
(require 'package)
;;(add-to-list 'package-archives
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")
	("melpa"        . "http://melpa.org/packages/"))
      package-archive-priorities
      '(("gnu"          . 15)
	("melpa-stable" . 10)
	("melpa"        . 5)))
	     
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun kafka-install-package (package-name)
  (unless (package-installed-p package-name)
    (package-install package-name)))

(setq my-packages '(anti-zenburn-theme
		    anzu
		    auctex
		    beacon
		    cider
		    clojure-mode
		    clojure-mode-extra-font-locking
		    cmake-project
		    company
		    company-irony
		    company-irony-c-headers
		    company-go
		    company-statistics
		    company-web
		    cperl-mode
		    dash
		    elfeed
		    flycheck
		    ess
		    engine-mode
		    irony
		    js2-mode
		    js3-mode
		    magit
		    markdown-mode
		    muse
		    paredit
		    rtags
		    simple-httpd
		    skewer-less
		    skewer-mode
		    slime
		    slime-company
		    web-completion-data
		    yasnippet
		    zenburn-theme		    
		    ))

(mapc 'kafka-install-package my-packages)

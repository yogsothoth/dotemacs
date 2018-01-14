;; org-mode based planner
;; slightly adapted from John Wiegley's configuration and workflow
;; http://newartisans.com/2007/08/using-org-mode-as-a-day-planner/

(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; bind C-c ; to execute-extended-command
(add-hook 'org-mode-hook '(lambda () (local-set-key (kbd "C-c ;") 'execute-extended-command)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))))

(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-files'("~/org/todo.org"))
(setq org-default-notes-file '("~/org/notes.org"))
(setq org-agenda-ndays 7)
(setq org-deadline-warning-days 14)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-reverse-note-order t)
(setq org-fast-tag-selection-single-key (quote expert))
(setq org-agenda-custom-commands
   (quote (("d" todo "DELEGATED" nil)
	   ("c" todo "DONE|DEFERRED|CANCELLED" nil)
	   ("w" todo "WAITING" nil)
	   ("W" agenda "" ((org-agenda-ndays 21)))
	   ("A" agenda ""
	    ((org-agenda-skip-function
	      (lambda nil
		(org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
	     (org-agenda-ndays 1)
	     (org-agenda-overriding-header "Today's Priority #A tasks: ")))
	   ("u" alltodo ""
	    ((org-agenda-skip-function
	      (lambda nil
		(org-agenda-skip-entry-if (quote scheduled) (quote deadline)
					  (quote regexp) "\n]+>")))
	     (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
(setq org-capture-templates
   '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
             "* TODO %?\n %u\n  %i\n  %a")
        ("n" "Notes" entry (file+datetree "~/org/notes.org")
	 "* %?\nEntered on %U\n  %i\n  %a")))

;; beastieboy.net
;; custom header, footer, etc.
(defvar beastieboy-header
  "<link rel=\"stylesheet\" href=\"css/site.css\" type=\"text/css\"/>")
(defvar beastieboy-preamble
  "<div class=\"intro\">
     <h1><b>Beastie</b>Boy</h1>
     <p>FreeBSD, Lisp, Emacs, PostgreSQL & co.</p>
   </div>
   <div class=\"nav\">
    <ul>
      <li><a href=\"index.html\">Home</a></li>
      <li><a href=\"gopher://gopher.beastieboy.net:70\">Gopher</a></li>
      <li><a href=\"about.html\">About</a></li>
      <li><a href=\"contact.html\">Contact</a></li>
      <li><a href=\"https://mastodon.sdf.org/@beastieboy\">Mastodon</a></li>
    </ul>
   </div>")
(defvar beastieboy-footer
  "<div class=\"footer\">
      &copy; 2017-2018 %a.<br/>
      Created %d.<br/>
      Last updated %C. <br/>
      Built with %c.<br/>
      <img src=\"images/powered-freebsd.gif\" alt=\"Powered by FreeBSD\"/>
   </div>")
(setq org-publish-project-alist
      `(
	("org"
	 :base-directory "~/org/beastieboy.net"
	 :publishing-directory "~/beastieboy.net/"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :section-numbers nil
	 :with-toc nil
	 :base-extension "org"
	 :html-head ,beastieboy-header
	 :html-preamble ,beastieboy-preamble
	 :html-postamble ,beastieboy-footer)
	("org-images"
	 :base-directory "~/org/beastieboy.net/images"
	 :publishing-directory "~/beastieboy.net/images/"
	 :base-extension "png\\|jpg\\|gif"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("org-js"
	 :base-directory "~/org/beastieboy.net/js"
	 :publishing-directory "~/beastieboy.net/js/"
	 :base-extension "js"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("org-css"
	 :base-directory "~/org/beastieboy.net/css"
	 :publishing-directory "~/beastieboy.net/css/"
	 :base-extension "css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("org-remote"
	 :base-directory "~/org/beastieboy.net"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :section-numbers nil
	 :with-toc nil
	 :base-extension "org"
	 :html-head ,beastieboy-header
	 :html-preamble ,beastieboy-preamble
	 :html-postamble ,beastieboy-footer)
	("org-images-remote"
	 :base-directory "~/org/beastieboy.net/images"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/images/"
	 :base-extension "png\\|jpg\\|gif"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("org-js-remote"
	 :base-directory "~/org/beastieboy.net/js"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/js/"
	 :base-extension "js"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("org-css-remote"
	 :base-directory "~/org/beastieboy.net/css"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/css/"
	 :base-extension "css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("beastieboy" :components ("org" "org-images" "org-js" "org-css"))
	("beastieboy-remote" :components ("org-remote" "org-images-remote" "org-js-remote" "org-css-remote"))))

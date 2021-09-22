;; org-mode based planner

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;(add-hook 'org-mode-hook '(lambda () (local-set-key (kbd "C-c ;") 'execute-extended-command)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(define-key mode-specific-map [?a] 'org-agenda)

(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-files '("~/gtd/inbox.org"
			 "~/gtd/gtd.org"
			 "~/gtd/tickler.org"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/gtd/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/gtd/tickler.org" "Tickler")
                               "* %i%? \n %T")))

(setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                           ("~/gtd/someday.org" :level . 1)
                           ("~/gtd/tickler.org" :maxlevel . 2)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-refile-allow-creating-parent-nodes t)

;; tags
(setq org-tag-alist '(("@jobb" . ?j)
		      ("@ute" . ?u)
		      ("@telefon" . ?t)
		      ("@epost" . ?e)
		      ("@web" . ?w)
		      ("@laptop" . ?l)
		      ("@hjemme" . ?h)
		      ("freebsd" . ?f)
		      ("7b" .?7)
		      ("kreativskriving" . ?k)
		      ("rpg" . ?r)
		      ("blog" . ?b)
		      ("norsk" . ?n)
		      ("idrett" . ?i)
		      ("foto" . ?p)
		      ("spill" . ?s)))

;; agenda commands and contexts
(setq org-agenda-custom-commands 
      '(("j" "Jobb og virtuelt kontor" tags-todo "@jobb"
         ((org-agenda-overriding-header "Jobb")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("7" "7bridges" tags-todo "7b"
         ((org-agenda-overriding-header "7b")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("u" "Gjør det når ute" tags-todo "@ute"
         ((org-agenda-overriding-header "Gjør det når ute")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("h" "Gjør det når hjemme" tags-todo "@hjemme"
         ((org-agenda-overriding-header "Gjør det når hjemme")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("l" "Gjør det når på laptop" tags-todo "@laptop"
         ((org-agenda-overriding-header "Gjør det når på laptop")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("n" "Lær norsk" tags-todo "norsk"
         ((org-agenda-overriding-header "Lær norsk")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("t" "Når på telefon" tags-todo "@telefon"
         ((org-agenda-overriding-header "Når på telefon")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
	("e" "Når på e-post" tags-todo "@e-post"
         ((org-agenda-overriding-header "Når på e-post")
	  (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))

(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(setq org-agenda-ndays 7)
(setq org-deadline-warning-days 14)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)
(setq org-reverse-note-order t)
(setq org-fast-tag-selection-single-key (quote expert))

;; beastieboy.net
;; custom header, footer, etc.
(defvar beastieboy-net-header
  "<link rel=\"stylesheet\" href=\"css/site.css\" type=\"text/css\"/>")
(defvar beastieboy-net-preamble
  "<div class=\"intro\">
     <h1><b>Beastie</b>Boy</h1>
     <p>FreeBSD, Lisp, Emacs, PostgreSQL &amp; co.</p>
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
(defvar beastieboy-net-footer
  "<div class=\"footer\">
      &copy; 2017-2018 %a.<br/>
      Created %d.<br/>
      Last updated %C. <br/>
      Built with %c.<br/>
      <img src=\"images/powered-freebsd.gif\" alt=\"Powered by FreeBSD\"/>
   </div>")


;; beastieboy.no
(defvar beastieboy-no-header
  "<link rel=\"stylesheet\" href=\"css/site.css\" type=\"text/css\"/>")
(defvar beastieboy-no-preamble
  "<div class=\"intro\">
     <h1><b>Beastie</b>Boy</h1>
     <p>FreeBSD, Lisp og liv som en utlending i Norge</p>
   </div>
   <div class=\"nav\">
    <ul>
      <li><a href=\"index.html\">Hjem</a></li>
      <li><a href=\"om.html\">Om meg</a></li>
      <li><a href=\"kontakt.html\">Kontakt meg</a></li>
    </ul>
   </div>")
(defvar beastieboy-no-footer
  "<div class=\"footer\">
      &copy; 2021 %a.<br/>
      Lagt %d.<br/>
      Sist oppdatert %C. <br/>
      Lagt med %c.<br/>
      <img src=\"images/powered-freebsd.gif\" alt=\"Powered by FreeBSD\"/>
   </div>")


(setq org-publish-project-alist
      `(
	("bboy-net-org"
	 :base-directory "~/org/beastieboy.net"
	 :publishing-directory "~/beastieboy.net/"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :section-numbers nil
	 :with-toc nil
	 :base-extension "org"
	 :html-head ,beastieboy-net-header
	 :html-preamble ,beastieboy-net-preamble
	 :html-postamble ,beastieboy-net-footer)
	("bboy-net-org-images"
	 :base-directory "~/org/beastieboy.net/images"
	 :publishing-directory "~/beastieboy.net/images/"
	 :base-extension "png\\|jpg\\|gif"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-net-org-js"
	 :base-directory "~/org/beastieboy.net/js"
	 :publishing-directory "~/beastieboy.net/js/"
	 :base-extension "js"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-net-org-css"
	 :base-directory "~/org/beastieboy.net/css"
	 :publishing-directory "~/beastieboy.net/css/"
	 :base-extension "css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-net-org-remote"
	 :base-directory "~/org/beastieboy.net"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :section-numbers nil
	 :with-toc nil
	 :base-extension "org"
	 :html-head ,beastieboy-net-header
	 :html-preamble ,beastieboy-net-preamble
	 :html-postamble ,beastieboy-net-footer)
	("bboy-net-org-images-remote"
	 :base-directory "~/org/beastieboy.net/images"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/images/"
	 :base-extension "png\\|jpg\\|gif"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-net-org-js-remote"
	 :base-directory "~/org/beastieboy.net/js"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/js/"
	 :base-extension "js"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-net-org-css-remote"
	 :base-directory "~/org/beastieboy.net/css"
	 :publishing-directory "/ssh:beastieboy@beastieboy.net:/usr/local/www/beastieboy.net/css/"
	 :base-extension "css"
	 :publishing-function org-publish-attachment
	 :recursive t)

("bboy-no-org"
	 :base-directory "~/org/beastieboy.no"
	 :publishing-directory "~/beastieboy.no/"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :section-numbers nil
	 :with-toc nil
	 :base-extension "org"
	 :html-head ,beastieboy-no-header
	 :html-preamble ,beastieboy-no-preamble
	 :html-postamble ,beastieboy-no-footer)
	("bboy-no-org-images"
	 :base-directory "~/org/beastieboy.no/images"
	 :publishing-directory "~/beastieboy.no/images/"
	 :base-extension "png\\|jpg\\|gif"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-no-org-js"
	 :base-directory "~/org/beastieboy.no/js"
	 :publishing-directory "~/beastieboy.no/js/"
	 :base-extension "js"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-no-org-css"
	 :base-directory "~/org/beastieboy.no/css"
	 :publishing-directory "~/beastieboy.no/css/"
	 :base-extension "css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-no-org-remote"
	 :base-directory "~/org/beastieboy.no"
	 :publishing-directory "/ssh:beastieboy@beastieboy.no:/data/www/beastieboy.no/"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :section-numbers nil
	 :with-toc nil
	 :base-extension "org"
	 :html-head ,beastieboy-no-header
	 :html-preamble ,beastieboy-no-preamble
	 :html-postamble ,beastieboy-no-footer)
	("bboy-net-org-images-remote"
	 :base-directory "~/org/beastieboy.no/images"
	 :publishing-directory "/ssh:beastieboy@beastieboy.no:/data/www/beastieboy.no/images/"
	 :base-extension "png\\|jpg\\|gif"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-no-org-js-remote"
	 :base-directory "~/org/beastieboy.no/js"
	 :publishing-directory "/ssh:beastieboy@beastieboy.no:/data/www/beastieboy.no/js/"
	 :base-extension "js"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("bboy-no-org-css-remote"
	 :base-directory "~/org/beastieboy.no/css"
	 :publishing-directory "/ssh:beastieboy@beastieboy.no:/data/www/beastieboy.no/css/"
	 :base-extension "css"
	 :publishing-function org-publish-attachment
	 :recursive t)
	("beastieboy-net" :components ("bboy-net-org" "bboy-net-org-images" "bboy-net-org-js" "bboy-net-org-css"))
	("beastieboy-net-remote" :components ("bboy-net-org-remote" "bboy-net-org-images-remote" "bboy-net-org-js-remote" "bboy-net-org-css-remote"))
	("beastieboy-no" :components ("bboy-no-org" "bboy-no-org-images" "bboy-no-org-js" "bboy-no-org-css"))
	("beastieboy-no-remote" :components ("bboy-no-org-remote" "bboy-no-org-images-remote" "bboy-no-org-js-remote" "bboy-no-org-css-remote"))))

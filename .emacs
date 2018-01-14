;; .emacs file
;; Nicolas Herry (kafka)

;; UTF-8 by default

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment "UTF-8")

;; load personal stuff
;; this is taken directy from here
;; http://stackoverflow.com/questions/2079095/how-to-modularize-an-emacs-configuration

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	 user-emacs-directory)
	((boundp 'user-init-directory)
	 user-init-directory)
	(t "~/.emacs.d")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; download and install automatically all missing packages
(load-user-file "my-packages.el")

;; load my own functions
(load-user-file "my-funcs.el")

;; configure the ui
(load-user-file "ui.el")

;; global completion configuration
(load-user-file "completion.el")

;; global spelling configuration
;;(load-user-file "spelling.el")

;; modes-specific configuration
(load-user-file "latex.el")
(load-user-file "r.el")
(load-user-file "cpp.el")
(load-user-file "perl.el")
(load-user-file "elisp.el")
(load-user-file "clojure.el")
(load-user-file "haskell.el")
(load-user-file "lisp.el")
(load-user-file "markdown.el")
(load-user-file "sql.el")
(load-user-file "soql.el")
(load-user-file "my-term.el")

;; git
(load-user-file "my-git.el")

;; gopher
(load-user-file "my-gopher.el")

;; eshell functions
(load-user-file "my-eshell.el")

;; proced
(load-user-file "my-proced.el")

;; dired
(load-user-file "my-dired.el")

;; buffers and file opening
(load-user-file "buffers.el")

;; keybindings
(load-user-file "keybindings.el")

;; email
(load-user-file "gnus.el")
;;(load-user-file "my-bbdb.el")

;; music
;;(load-user-file "music.el")

;; web stuff
;;(load-user-file "web.el")

;; muse
;;(load-user-file "my-muse.el")

;; org-based planner
(load-user-file "my-org.el")

;; general web development
;;(load-user-file "web-dev.el")

;; stupid stuff
(load-user-file "zone.el")

;; set exec-path
(setq exec-path
	(append
	 exec-path
	 '("~/bin")))

;; cygwin
;; (setq exec-path
;;       (append
;;        exec-path
;;        '("c:/cygwin64/bin")))

;; bookmarks
;; automatically save bookmarks
(setq bookmark-save-flag 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("11e5e95bd3964c7eda94d141e85ad08776fbdac15c99094f14a0531f31a156da" "deb7ae3a735635a85c984ece4ce70317268df6027286998b0ea3d10f00764c9b" "595099e6f4a036d71de7e1512656e9375dd72cf60ff69a5f6d14f0171f1de9c1" "011d4421eedbf1a871d1a1b3a4d61f4d0a2be516d4c94e111dfbdc121da0b043" "2cff3dc876b564f80dd2d401ef0b3a6d4f18e76a52939926371fa340c59f2417" "5545ef1841b83d21d6437a1e00103f379099b136215b71393c091beadef9f9d0" "0cdc78c8527934e79f015bc962263c2bb8b603d2d4f63e52ad35c7298fab7ca8" "de4f120a2119206e439b1f4a0e02666de755ef32a17c8512121b08e48e6aee08" "b682ef59ce31428f549f5577395267a6da08af547ba5a10625b6490abec50607" "bbb51078321186cbbbcb38f9b74ea154154af10c5d9c61d2b0258cb4401ac038" "eb399cbd3ea4c93d9ab15b513fd6638e801600e13c8a70b56f38e609397a5eca" "fd7ef8af44dd5f240e4e65b8a4eecbc37a07c7896d729a75ba036a59f82cfa58" "2588175e0f3591583582a72c465e6d38bd8c99b36daee949ab08f1e758052117" "7ec6a9707c69e7a4ea1a8761b3f28f8dc55c6c5cacd597718c994b1561e435f3" "c3806e9426f97f54eccd51bb90c1fabb9205bf359d9ab23311638e1a68aae472" "4f66410c3d3434129e230eaab99f9319bd5871623689fb56713e38255eb16ddc" "f2355ec455645cd4a4b8f8ac8bcb96c50bc8f383634e59307d8bc651143f6be4" "73e09ba6f23a9b3aeedb3ee8589da74182b644c169daa62c4454eac73eea610a" "3ddfde8b6afe9a72749b73b021ffd5a837f6b9d5c638f7c16d81ec9d346d899f" "80ee5b0e403162518b90236ba7c31c4f29192c451ad124097f31166c038f2523" "70b9e0d0b857d6497c6623bb360a3a7f915251c4a6233c30b65f9005eb9f4256" "822ee0a190e234546687e145e4fa97c858195023c595ea57878e59e06b25b6e6" "0ae977e603e99d89c80d679377bfed4a904317968bd885ee063455cee01728d3" "2d8569fc9eb766b0be02d3f7fbb629bcd26fe34f5d328497e1fc1ddcfd5126b9" "f22a0f5b85aed98055e4e5013cc104829d163067c03f8165ab03ae010d6e3d40" "ff9e6deb9cfc908381c1267f407b8830bcad6028231a5f736246b9fc65e92b44" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(package-selected-packages
   (quote
    (company-c-headers sr-speedbar ggtags w3m exwm exwm-x slime slime-company zenburn-theme yasnippet skewer-less paredit muse markdown-mode magit js3-mode flycheck ess engine-mode elfeed company-web company-statistics company-go cmake-project clojure-mode-extra-font-locking cider beacon auctex anzu anti-zenburn-theme)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/home/kafka/code/shimrod/src/include")
     (TeX-master . t))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(vlf-application (quote dont-ask)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

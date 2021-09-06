;; .emacs file
;; Nicolas Herry (kafka)

;; UTF-8 by default

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

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
;; moved to end of file
;;(load-user-file "ui.el")

;; global completion configuration
(load-user-file "completion.el")

;; global spelling configuration
;;(load-user-file "spelling.el")

;; modes-specific configuration
(load-user-file "latex.el")
;;--(load-user-file "r.el")
;;--(load-user-file "cpp.el")
(load-user-file "perl.el")
(load-user-file "elisp.el")
;;--(load-user-file "clojure.el")
;;--(load-user-file "haskell.el")
(load-user-file "lisp.el")
(load-user-file "markdown.el")
(load-user-file "sql.el")
(load-user-file "my-term.el")
(load-user-file "typescript.el")

;; git
(load-user-file "my-git.el")

;; gopher
;;--(load-user-file "my-gopher.el")

;; eshell functions
;;--(load-user-file "my-eshell.el")

;; proced
(load-user-file "my-proced.el")

;; dired
(load-user-file "my-dired.el")

;; buffers and file opening
(load-user-file "buffers.el")


;; email
(load-user-file "gnus.el")
;;(load-user-file "my-bbdb.el")

;; music and video
(load-user-file "my-emms.el")

;; pictures
(load-user-file "pictures.el")

;; web development
;;--(load-user-file "web-dev.el")

;; org-based planner
(load-user-file "my-org.el")

;; stumpwm
(load-user-file "stumpwm.el")

;; stupid stuff
;;(load-user-file "zone.el")

;; exwm
;;(load-user-file "exwm.el")

;; configure the ui
(load-user-file "ui.el")

;; keybindings
(load-user-file "keybindings.el")

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(beacon-color "#ed0547ad8099")
 '(blink-cursor-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("654b365467a92ff70c70f4926974e07dcdb34805d2787c51710b467e695342e6" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" "9aae3691e199e2e55f440eef40d2e3bd1e3d6c0e19106221e17f0c2a185e5ca8" "8e797edd9fa9afec181efbfeeebf96aeafbd11b69c4c85fa229bb5b9f7f7e66c" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "5072d2a17fcc18fe86e37876392e0a9d41a1569a29e73de5a656a8fcda2b7177" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "efef7ea25d225f2478248fad987d61ecf8827ab26c3a300ba772c546f67f1da6" "ebd9bea137cafba0138f5a6996aa6851c4ee8263844c75a57798faacbcf8e3e4" "170bb47b35baa3d2439f0fd26b49f4278e9a8decf611aa33a0dad1397620ddc3" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "8bb8a5b27776c39b3c7bf9da1e711ac794e4dc9d43e32a075d8aa72d6b5b3f59" "11e5e95bd3964c7eda94d141e85ad08776fbdac15c99094f14a0531f31a156da" "deb7ae3a735635a85c984ece4ce70317268df6027286998b0ea3d10f00764c9b" "595099e6f4a036d71de7e1512656e9375dd72cf60ff69a5f6d14f0171f1de9c1" "011d4421eedbf1a871d1a1b3a4d61f4d0a2be516d4c94e111dfbdc121da0b043" "2cff3dc876b564f80dd2d401ef0b3a6d4f18e76a52939926371fa340c59f2417" "5545ef1841b83d21d6437a1e00103f379099b136215b71393c091beadef9f9d0" "0cdc78c8527934e79f015bc962263c2bb8b603d2d4f63e52ad35c7298fab7ca8" "de4f120a2119206e439b1f4a0e02666de755ef32a17c8512121b08e48e6aee08" "b682ef59ce31428f549f5577395267a6da08af547ba5a10625b6490abec50607" "bbb51078321186cbbbcb38f9b74ea154154af10c5d9c61d2b0258cb4401ac038" "eb399cbd3ea4c93d9ab15b513fd6638e801600e13c8a70b56f38e609397a5eca" "fd7ef8af44dd5f240e4e65b8a4eecbc37a07c7896d729a75ba036a59f82cfa58" "2588175e0f3591583582a72c465e6d38bd8c99b36daee949ab08f1e758052117" "7ec6a9707c69e7a4ea1a8761b3f28f8dc55c6c5cacd597718c994b1561e435f3" "c3806e9426f97f54eccd51bb90c1fabb9205bf359d9ab23311638e1a68aae472" "4f66410c3d3434129e230eaab99f9319bd5871623689fb56713e38255eb16ddc" "f2355ec455645cd4a4b8f8ac8bcb96c50bc8f383634e59307d8bc651143f6be4" "73e09ba6f23a9b3aeedb3ee8589da74182b644c169daa62c4454eac73eea610a" "3ddfde8b6afe9a72749b73b021ffd5a837f6b9d5c638f7c16d81ec9d346d899f" "80ee5b0e403162518b90236ba7c31c4f29192c451ad124097f31166c038f2523" "70b9e0d0b857d6497c6623bb360a3a7f915251c4a6233c30b65f9005eb9f4256" "822ee0a190e234546687e145e4fa97c858195023c595ea57878e59e06b25b6e6" "0ae977e603e99d89c80d679377bfed4a904317968bd885ee063455cee01728d3" "2d8569fc9eb766b0be02d3f7fbb629bcd26fe34f5d328497e1fc1ddcfd5126b9" "f22a0f5b85aed98055e4e5013cc104829d163067c03f8165ab03ae010d6e3d40" "ff9e6deb9cfc908381c1267f407b8830bcad6028231a5f736246b9fc65e92b44" default))
 '(evil-emacs-state-cursor '("#E57373" hbar))
 '(evil-insert-state-cursor '("#E57373" bar))
 '(evil-normal-state-cursor '("#FFEE58" box))
 '(evil-visual-state-cursor '("#C5E1A5" box))
 '(fci-rule-color "#383838")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   '("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80"))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors '(("#ed0547ad8099" . 0) ("#424242" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(hl-sexp-background-color "#efebe9")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(nrepl-message-colors
   '("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c"))
 '(package-selected-packages
   '(avy dap-mode helm-lsp helm-xref hydra json-mode lsp-mode lsp-treemacs projectile which-key sunburn-theme apropospriate-theme cyberpunk-2019-theme cyberpunk-theme darktooth-theme doom-themes gruvbox-theme solarized-theme subatomic-theme subatomic256-theme silkworm-theme xelb tide ample-theme lenlen-theme challenger-deep-theme eziam-theme liso-theme nimbus-theme nord-theme oceanic-theme sexy-monochrome-theme sourcerer-theme company-c-headers sr-speedbar ggtags w3m exwm exwm-x slime slime-company zenburn-theme yasnippet skewer-less paredit muse markdown-mode magit js3-mode flycheck ess engine-mode elfeed company-web company-statistics company-go cmake-project clojure-mode-extra-font-locking beacon auctex anzu anti-zenburn-theme))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pos-tip-background-color "#3a933a933a93")
 '(pos-tip-foreground-color "#9E9E9E")
 '(safe-local-variable-values
   '((company-clang-arguments "-I/home/kafka/code/shimrod/src/include")
     (TeX-master . t)))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(stumpbuffer-quit-window-after-command nil)
 '(tabbar-background-color "#357535753575")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#BC8383")
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
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(vlf-application 'dont-ask)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

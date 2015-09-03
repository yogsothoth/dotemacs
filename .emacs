;; .emacs file
;; Nicolas Herry (kafka)



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

;; modes-specific configuration
(load-user-file "latex.el")
(load-user-file "r.el")
(load-user-file "perl.el")
(load-user-file "elisp.el")
(load-user-file "clojure.el")
(load-user-file "haskell.el")
(load-user-file "sql.el")
(load-user-file "soql.el")

;; eshell functions
(load-user-file "my-eshell.el")

;; buffers and file opening
(load-user-file "buffers.el")

;; keybindings
(load-user-file "keybindings.el")

;; web stuff
(load-user-file "web.el")
;; set exec-path
(setq exec-path
	(append
	 exec-path
	 '("~/bin")))


;; bookmarks
;; automatically save bookmarks
(setq bookmark-save-flag 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fd7ef8af44dd5f240e4e65b8a4eecbc37a07c7896d729a75ba036a59f82cfa58" "2588175e0f3591583582a72c465e6d38bd8c99b36daee949ab08f1e758052117" "7ec6a9707c69e7a4ea1a8761b3f28f8dc55c6c5cacd597718c994b1561e435f3" "c3806e9426f97f54eccd51bb90c1fabb9205bf359d9ab23311638e1a68aae472" "4f66410c3d3434129e230eaab99f9319bd5871623689fb56713e38255eb16ddc" "f2355ec455645cd4a4b8f8ac8bcb96c50bc8f383634e59307d8bc651143f6be4" "73e09ba6f23a9b3aeedb3ee8589da74182b644c169daa62c4454eac73eea610a" "3ddfde8b6afe9a72749b73b021ffd5a837f6b9d5c638f7c16d81ec9d346d899f" "80ee5b0e403162518b90236ba7c31c4f29192c451ad124097f31166c038f2523" "70b9e0d0b857d6497c6623bb360a3a7f915251c4a6233c30b65f9005eb9f4256" "822ee0a190e234546687e145e4fa97c858195023c595ea57878e59e06b25b6e6" "0ae977e603e99d89c80d679377bfed4a904317968bd885ee063455cee01728d3" "2d8569fc9eb766b0be02d3f7fbb629bcd26fe34f5d328497e1fc1ddcfd5126b9" "f22a0f5b85aed98055e4e5013cc104829d163067c03f8165ab03ae010d6e3d40" "ff9e6deb9cfc908381c1267f407b8830bcad6028231a5f736246b9fc65e92b44" default)))
 '(safe-local-variable-values (quote ((TeX-master . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

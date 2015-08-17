;; .emacs file
;; Nicolas Herry (kafka)

;; Packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Global keybindings
;; I don't want to have to type ALT-x or META-x, but
;; use Control instead
(global-set-key (kbd "C-c ;") 'execute-extended-command)

;; use standard keys for searching
(global-set-key (kbd "C-c /") 'search-forward-regexp)
(global-set-key (kbd "C-c ?") 'search-backward-regexp)

;; erase whole words in case of typos and bind that to something on
;; the home row
;; C-j is bound to newline-and-indent by default
;; but recent emacs versions seem to do something sensible with plain RET nowadays
(global-set-key (kbd "C-j") 'backward-kill-word)

;; Some handy functions
;; zap-up-to-char
;; Deletes up to ARGth occurrence of char, without deleting char
;; Note: was at some point in the main Emacs repo, but can't find it now
;; http://repo.or.cz/w/emacs.git/blob/HEAD:/lisp/misc.el
(defun zap-up-to-char (arg char)
  "Kill up to, but not including ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found.
Ignores CHAR at point."
  (interactive "p\ncZap up to char: ")
  (let ((direction (if (>= arg 0) 1 -1)))
    (kill-region (point)
		 (progn
		   (forward-char direction)
		   (unwind-protect
		       (search-forward (char-to-string char) nil nil arg)
		     (backward-char direction))
		   (point)))))

(global-set-key "\M-Z" 'zap-to-char)
(global-set-key "\M-z" 'zap-up-to-char)

;; emulate vi' J command
(defun join-next-line ()
       "Join the current line with the next one, leaving point unchanged."
       (interactive)
       (save-excursion
	(next-line)
	(join-line)))
(global-set-key (kbd "C-c j") 'join-next-line)

;; rename buffers and files
;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; Revert (reload) a buffer from file
;; taken from
(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))

(global-set-key (kbd "<f5>") 'revert-this-buffer)

;; Open file in the other window
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; company-mode everywhere
(add-hook 'after-init-hook 'global-company-mode)

;; YASnippet
;; the following should help if do the right thing when company-mode is enabled
;; taken from http://stackoverflow.com/questions/2087225/about-the-fix-for-the-interference-between-company-mode-and-yasnippet

(require 'yasnippet)
(yas-global-mode 1)

(defun company-yasnippet-or-completion ()
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))

(add-hook 'company-mode-hook (lambda ()
			       (substitute-key-definition 'company-complete-common
							  'company-yasnippet-or-completion
							  company-active-map)))



;; ido
;; config from https://masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffers 'always)
(setq ido-ignore-extensions t)

;; open recent files
;; recentf + ido
;; taken from https://masteringemacs.org/article/find-files-faster-recent-files-package
(require 'recentf)

(defun ido-recentf-open ()
  "Use 'ido-completing-read' to \\[find-file]] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file:" recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(recentf-mode t)

(setq recentf-max-saved-items 50)


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

(load-user-file "my-packages.el")
(load-user-file "ui.el")
(load-user-file "latex.el")
(load-user-file "r.el")
(load-user-file "perl.el")
(load-user-file "elisp.el")

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

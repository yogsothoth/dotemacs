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

;; zap-up-to-char
(global-set-key "\M-Z" 'zap-to-char)
(global-set-key "\M-z" 'zap-up-to-char)

;; join lines like in vi
(global-set-key (kbd "C-c j") 'join-next-line)

;; reload buffer from file
(global-set-key (kbd "<f5>") 'revert-this-buffer)

;; Open file in the other window
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; open recent files
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; move META to Command on OS X
;; so { } [ ] \ can be typed
;; still need to find where to put CTRL-Space
(if (eq system-type 'darwin)
    (setq mac-option-modifier nil
	  mac-command-modifier 'meta
	  x-select-enable-clipboard t))

;; insert date
(global-set-key (kbd "C-c d") 'insert-date)

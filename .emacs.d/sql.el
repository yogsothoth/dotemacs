;; SQL
(add-hook 'sql-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))


;; Load RDBMS-specific modes
(add-to-list 'load-path "~/.emacs.d/floating/rdbms")

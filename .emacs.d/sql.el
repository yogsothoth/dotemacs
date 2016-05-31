;; SQL
(add-hook 'sql-mode-hook
	  (lambda ()
	    (sql-highlight-postgres-keywords)
	    (flycheck-mode)
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))


;; Load RDBMS-specific modes
(add-to-list 'load-path "~/.emacs.d/floating/rdbms")

;; sql-indent
(add-to-list 'load-path "~/.emacs.d/floating/sql-indent")
(eval-after-load "sql"
  '(load-library "sql-indent"))

;; sqlup-mode
(add-to-list 'load-path "~/code/sqlup-mode.el")
(eval-after-load "sql"
  '(load-library "sqlup-mode"))
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)

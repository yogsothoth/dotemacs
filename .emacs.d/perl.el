;; Perl
;; use cperl-mode instead of the default perl-mode
(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))



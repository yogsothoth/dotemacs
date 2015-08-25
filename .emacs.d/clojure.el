;; clojure.el
;; configuration for Clojure programming

(require 'cider)

;; enable eldoc in clojure buffers
(add-hook 'cider-mode-hook #'eldoc-mode)

;; suppress auto-enabling of cider-mode in clojure-mode buffers
(setq cider-auto-mode nil)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))

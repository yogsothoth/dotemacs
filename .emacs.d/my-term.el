;; configuration for term/ansi-term

;; deactivate yasnippet to avoid tab-completion issues
(add-hook 'term-mode-hook (lambda ()
			    (setq yas-dont-activate t)))

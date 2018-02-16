;; lisp.el
;; configuration for lisp development

(setq inferior-lisp-program "sbcl --dynamic-space-size 2048")
(add-to-list 'slime-contribs 'slime-autodoc)
;;(slime-setup '(slime-company))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(load (expand-file-name "~/code/slime-repl-ansi-color/slime-repl-ansi-color.el"))
(slime-setup '(slime-fancy slime-banner slime-repl-ansi-color))

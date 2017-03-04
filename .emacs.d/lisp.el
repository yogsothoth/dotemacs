;; lisp.el
;; configuration for lisp development

(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-company))
(load (expand-file-name "~/quicklisp/slime-helper.el"))

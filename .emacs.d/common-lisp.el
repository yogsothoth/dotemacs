;; common-lisp.el
;; common-lisp-specific configuration and interaction

(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "~/local/bin/sbcl")

;; testing
(defun test-system ()
  (interactive)
  (slime-repl-send-string `(cl:format nil "(asdf:test-system 'dsp)"))
  (if (not (string= "*slime-repl sbcl*" (buffer-name)))
      (switch-to-buffer-other-frame "*slime-repl sbcl*")))

(global-set-key (kbd "C-c z") 'test-system)

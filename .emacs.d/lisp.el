;; lisp.el
;; configuration for lisp development

(setq inferior-lisp-program "sbcl --dynamic-space-size 2048")

;; contribs
(require 'slime-autoloads)

;; better slime interaction mode
(add-to-list 'slime-contribs 'inferior-slime)

;; autodoc
(add-to-list 'slime-contribs 'slime-autodoc)

;; asdf
(add-to-list 'slime-contribs 'slime-asdf)

;; highlight edits
(add-to-list 'slime-contribs 'slime-highlight-edits)

;; typeout frame
(add-to-list 'slime-contribs 'slime-typeout-frame)

;; profiling
(add-to-list 'slime-contribs 'slime-sprof)

;;(slime-setup '(slime-company))
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(load (expand-file-name "~/code/slime-repl-ansi-color/slime-repl-ansi-color.el"))

(slime-setup '(slime-fancy slime-banner slime-repl-ansi-color))

;; slime repl in a dedicated buffer
;; from https://emacs.stackexchange.com/questions/3513/starting-slime-in-a-pop-up-frame/3516
;; (setq display-buffer-alist
;;       (quote (("\\*inferior-lisp\\*" display-buffer-pop-up-frame
;; 	       (nil)))))

;; indentation for lisp: sbc
(require 'slime-indentation)
(setq lisp-indent-function 'common-lisp-indent-function)
(setq common-lisp-style "sbcl")

(defvar kafka-lisp-system-to-test nil
  "The lisp system to be tested by TEST-SYSTEM.")

(defun set-test-system (x)
  "Sets the lisp system to test"
  (interactive "sSystem to test:")
  (setq kafka-lisp-system-to-test (concat "'" x)))

;; testing
(defun test-system ()
  (interactive)
  (let ((b (current-buffer))
	(asdf-command (concat "(asdf:test-system " kafka-lisp-system-to-test ")")))
    (message asdf-command)
    (slime-repl-send-string `(cl:format nil ,asdf-command))
    (if (not (string= "*slime-repl sbcl*" (buffer-name)))
	(switch-to-buffer-other-window "*slime-repl sbcl*"))))

(global-set-key (kbd "C-c t") 'test-system)
(global-set-key (kbd "C-c z") 'set-test-system)

(require 'paredit)
(add-hook 'lisp-mode-hook 'paredit-mode)


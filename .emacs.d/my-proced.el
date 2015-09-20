;; proced configuration
;; auto-update processes list
;; taken fro, http://www.masteringemacs.org/article/displaying-interacting-processes-proced
(defun proced-settings ()
  (proced-toggle-auto-update))

(add-hook 'proced-mode-hook 'proced-settings)

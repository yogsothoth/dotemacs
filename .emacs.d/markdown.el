;; markdown mode configuration
;; useful for github documentation
;; and internal documentation at work

;; the following comes straight from the docs
;; http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Mardown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md'" . markdown-mode))

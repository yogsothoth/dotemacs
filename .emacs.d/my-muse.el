;; muse configuration

;; muse relies on htmlize, which doesn't seem to be in a public
;; repository like ELPA or Stable MELPA (haven't tried normal MELPA)
;; I got the file from http://www.emacswiki.org/emacs/download/htmlize.el
(add-to-list 'load-path "~/.emacs.d/floating")

;; main mode
(require 'muse-mode)

;; publishing styles
(require 'muse-html)
(require 'muse-latex)

;; organise files in projects
(require 'muse-project)

;; use footnote when editing muse files
(add-hook 'muse-mode-hook 'footnote-mode)


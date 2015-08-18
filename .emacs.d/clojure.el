;; clojure.el
;; configuration for Clojure programming

(require 'cider)

;; enable eldoc in clojure buffers
(add-hook 'cider-mode-hook #'eldoc-mode)

;; suppress auto-enabling of cider-mode in clojure-mode buffers
(setq cider-auto-mode nil)

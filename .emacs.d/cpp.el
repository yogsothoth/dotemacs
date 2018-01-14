;; cpp.el
;; C++ configuration
(require 'cc-mode)

(require 'company)
(require 'ggtags)

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;;               (ggtags-mode 1))))

;; (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;; (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;; (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;; (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;; (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;; (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

;;(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
;;(setq imenu-create-index-function #'ggtags-build-imenu-index)

(require 'cmake-ide)
(cmake-ide-setup)

(require 'sr-speedbar)

;;(setq company-backends (delete 'company-semantic company-backends))

;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)

;; (require 'company-c-headers)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/local/llvm50/include/")
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/v1/")





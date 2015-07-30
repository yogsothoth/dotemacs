;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; No assumption regarding the master file
(setq-default TeX-master nil)
;; Activate fold mode by default
(add-hook 'TeX-mode-hook
      (lambda () (TeX-fold-mode 1)))
;; Load french dictionary when writing french documents
(add-hook 'TeX-language-fr-hook
	  (lambda () (ispell-change-dictionary "francais-tex")))
;; Nomenclature setup
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list 
                '("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls"
                  (lambda (name command file)
                    (TeX-run-compile name command file)
                    (TeX-process-set-variable file 'TeX-command-next TeX-command-default))
                  nil t :help "Create nomenclature file")))
;; latekmk setup
(defun run-latexmk ()
  (interactive)
  (let ((TeX-save-query nil)
        (TeX-process-asynchronous nil)
        (master-file (TeX-master-file)))
    (TeX-save-document "")
    (TeX-run-TeX "latexmk"
                 (TeX-command-expand "latexmk -pdf %t" 'TeX-master-file)
                 master-file)
    (if (plist-get TeX-error-report-switches (intern master-file))
        (TeX-next-error t)
      (minibuffer-message "latexmk done"))))

;; RefTeX
; Turn on RefTeX for AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
; Make RefTeX interact with AUCTeX
(setq reftex-plug-into-AUCTeX t)

;; OSX-specific
(setenv "PATH"
	(concat
	 "/usr/local/texlive/2014/bin/x86_64-darwin" ":"
	 (getenv "PATH")))


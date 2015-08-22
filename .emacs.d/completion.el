;; completion.el
;; configure global completion for all modes
;; modes-specific configuration can be found in their own dedicated file

;; company-mode everywhere
(add-hook 'after-init-hook 'global-company-mode)

;; YASnippet
;; the following should help if do the right thing when company-mode is enabled
;; taken from http://stackoverflow.com/questions/2087225/about-the-fix-for-the-interference-between-company-mode-and-yasnippet

(require 'yasnippet)
(yas-global-mode 1)

(defun company-yasnippet-or-completion ()
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))

(add-hook 'company-mode-hook (lambda ()
			       (substitute-key-definition 'company-complete-common
							  'company-yasnippet-or-completion
							  company-active-map)))



;; ido
;; config from https://masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffers 'always)
(setq ido-ignore-extensions t)

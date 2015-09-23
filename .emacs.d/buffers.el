;; buffers.el
;; Buffer management, file opening

;; Cleanup buffers automatically
(require 'midnight)


;; open recent files
;; recentf + ido
;; taken from https://masteringemacs.org/article/find-files-faster-recent-files-package
(require 'recentf)

(defun ido-recentf-open ()
  "Use 'ido-completing-read' to \\[find-file]] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file:" recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; activate recent files mode
(recentf-mode t)

(setq recentf-max-saved-items 50)

;; open large buffers
(add-to-list 'load-path "~/.emacs.d/floating/vlfi")
(require 'vlf-setup)

;; trying out without asking
(custom-set-variables
 '(vlf-application 'dont-ask))

;; breadcrumb
(add-to-list 'load-path "~/.emacs.d/floating/breadcrumb")
(require 'breadcrumb)

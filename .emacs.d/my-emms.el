;(add-to-list 'load-path "~/code/emms/lisp")
(require 'emms-setup)
;;(emms-standard)
(emms-default-players)
(emms-all)
(setq emms-source-file-default-directory "~/music/")

(setq emms-browser-covers 'emms-browser-cache-thumbnail)

(add-to-list 'emms-info-functions 'emms-info-mp3info)
(add-to-list 'emms-info-functions 'emms-info-metaflac)
(setq emms-info-auto-update t)

;; markable playlists (edit ID3, etc.)
(require 'emms-mark)


;; (setq emms-browser-default-covers
;;       (list "/path/to/cover_small.jpg" nil nil))



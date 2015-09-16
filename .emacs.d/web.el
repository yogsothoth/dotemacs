;; web stuff for emacs
;; xkcd comics
(add-to-list 'load-path (expand-file-name "~/emacs-xkcd"))
(require 'xkcd)

;; RSS/Atom feeds
(require 'elfeed)

;; feeds
(setq elfeed-feeds
      '(("http://sachachua.com/blog/feed/" emacs)
	("http://www.win-vector.com/blog/feed/" data)
	("http://feeds.feedburner.com/datascienceplus?format=xml" data)))

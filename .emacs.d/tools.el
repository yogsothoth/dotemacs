;; some tools

;; eshell stuff
;; head utility for OSes where it's missing
(defun eshell/head (filepath n)
  "Insert the first N lines from the file at FILEPATH."
  (eshell-flush -1)
  (let* ((oldbuf (current-buffer))
	(contents (with-temp-buffer
		    (insert-file-contents filepath)
		    (split-string (buffer-string) "\n" t))))
    (mapc (lambda (x)
	   (eshell-buffered-print (concat x "\n"))) (kafka/nfirst n contents))
    (eshell-flush)))

(defun kafka/nfirst (n elements)
  "Returns the first N items from ELEMENTS, which must be a list."
  (cond ((> n (length elements)) (nfirst (length elements) elements))
        ((= n 0) nil)
        ((eq elements nil) nil)
        ((> n 0)
           (cons (car elements) (nfirst (1- n) (cdr elements))))))

;; tail utility for OSes where it's missing
(defun eshell/tail (filepath n)
  "Insert the last N lines from the file at FILEPATH."
  (eshell-flush -1)
  (let* ((oldbuf (current-buffer))
	(contents (with-temp-buffer
		    (insert-file-contents filepath)
		    (split-string (buffer-string) "\n" t))))
    (mapc (lambda (x)
	   (eshell-buffered-print (concat x "\n"))) (nthcdr (- (length contents) n) contents))
    (eshell-flush)))

;; word count
;; buggy and stupid for now
(defun kafka/count-words-region (start end)
  "Count regular words in the region between START and END."
  (interactive "r")
    (let ((count 0))
      (save-excursion
	(goto-char start)
	(while (and (< (point) end) (search-forward-regexp "\\sw+"))
	  (setq count (1+ count))))
      (message "Number of words in region: %d" count)))

;; some tools

;; eshell stuff
;; head utility for OSes where it's missing
(defun head (filePath n)
  "Insert the N first lines from the file at filePath."
  (let* ((oldbuf (current-buffer))
	(contents (with-temp-buffer
		    (insert-file-contents filePath)
		    (split-string (buffer-string) "\n" t))))
    (mapc (lambda (x)
	    (insert (concat "\n" x))) (nfirst n contents))))

(defun nfirst (n aList)
  "Returns the N first items from aList."
  (cond ((> n (length aList)) (nfirst (length aList) aList))
        ((= n 0) nil)
        ((eq aList nil) nil)
        ((> n 0)
           (cons (car aList) (nfirst (1- n) (cdr aList))))))


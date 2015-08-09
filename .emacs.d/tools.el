;; some tools

;; eshell stuff
;; head utility for OSes where it's missing
(defun eshell/head (filePath n)
  "Insert the N first lines from the file at filePath."
  (eshell-flush -1)
  (let* ((oldbuf (current-buffer))
	(contents (with-temp-buffer
		    (insert-file-contents filePath)
		    (split-string (buffer-string) "\n" t))))
    (mapc (lambda (x)
	   (eshell-buffered-print (concat x "\n"))) (nfirst n contents))
    (eshell-flush)))

(defun nfirst (n aList)
  "Returns the N first items from aList."
  (cond ((> n (length aList)) (nfirst (length aList) aList))
        ((= n 0) nil)
        ((eq aList nil) nil)
        ((> n 0)
           (cons (car aList) (nfirst (1- n) (cdr aList))))))


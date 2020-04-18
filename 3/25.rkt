#lang sicp

;; ex 3.25

(define (foldr op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (foldr op initial (cdr sequence)))))

(define (assoc key records)
  (cond ((null? records) false)
	((not (pair? (car records))) false)
	((eq? key (caar records)) (car records))
	(else (assoc key (cdr records)))))

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (insert! keys value)
      (define (iter keys tables)
        (if (null? keys)
	    (error "INSERT called with empty keys")
	    (let ((table (assoc (car keys) (cdr tables))))
	      (if table
		  (if (null? (cdr keys))
		      (set-cdr! table (list value))
		      (iter (cdr keys) table))
		  (set-cdr! tables
			    (cons (list (car keys)
					(foldr list
					       value (cdr keys)))
				  (cdr tables)))))))
      (iter keys local-table))
    (define (lookup keys)
      (define (iter keys tables)
	(if (null? keys)
	    false
	    (let ((table (assoc (car keys) (cdr tables))))
	      (if table
		  (if (null? (cdr keys))
		      (cadr table)
		      (iter (cdr keys) table))
		  false))))
      (iter keys local-table))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
	    ((eq? m 'insert-proc) insert!)
	    ((eq? m 'display-proc)
	     (display local-table)
	     (display "\n"))
	    (else (error "Unknown operation: TABLE" m))))
    dispatch))


;; (define z (make-table))
;; ((z 'insert-proc) '(math algebra) 'equations)
;; ((z 'insert-proc) '(math calculus derivative) 'limit)
;; ((z 'insert-proc) '(math) 'numbers)
;; ((z 'lookup-proc) '(math calculus))

#lang sicp

;; ex 3.17

(define (count-pairs x)
  (define visited-pairs '())
  (define (visited? p l)
    (if (null? l)
	false
	(if (eq? p (car l))
	    true
	    (visited? p (cdr l)))))
  (define (count-pairs-aux p)
    (cond ((and (pair? p)
		(not (visited? p visited-pairs)))
	   (set! visited-pairs
	     (cons p visited-pairs))
	   (count-pairs-aux (car p))
	   (count-pairs-aux (cdr p)))
	  ((pair? p)
	   (count-pairs-aux (car p))
	   (count-pairs-aux (cdr p)))))
  (count-pairs-aux x)
  (length visited-pairs))

(define z1 (cons 1 2))
(define z2 (cons z1 z1))
(define z3 (cons z2 z2))

;; (count-pairs z3)
;; 3

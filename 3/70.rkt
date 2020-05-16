#lang sicp

;; ex 3.70

(#%require "streams.rkt")

(#%provide merge-weighted
	   weighted-pairs)

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
	((stream-null? s2) s1)
	(else
	 (let ((s1car (stream-car s1))
	       (s2car (stream-car s2)))
	   (let ((s1w (weight s1car))
		 (s2w (weight s2car)))
	     (cond ((< s1w s2w)
		    (cons-stream
		     s1car
		     (merge-weighted (stream-cdr s1) s2 weight)))
		   ((> s1w s2w)
		    (cons-stream
		     s2car
		     (merge-weighted s1 (stream-cdr s2) weight)))
		   (else
		    (cons-stream
		     s1car
		     (cons-stream
		      s2car
		      (merge-weighted (stream-cdr s1)
				      (stream-cdr s2)
				      weight))))))))))

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
    weight)))

(define a-stream
  (weighted-pairs integers integers
		  (lambda (x) (+ (car x) (cadr x)))))

(define b-stream
  (weighted-pairs integers integers
		  (lambda (x)
		    (let ((i (car x))
			  (j (cadr x)))
			  (+ (* 2 i) (* 3 j) (* 5 i j))))))

(define (stream->list s n)
  (define (iter i)
    (if (> i n)
	'()
	(cons (stream-ref s i)
	      (iter (+ i 1)))))
  (iter 0))

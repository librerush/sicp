#lang sicp

;; ex 3.81

(#%require "streams.rkt")

(define (rand-update x)
  (let ((m (expt 2 31))
        (a 1103515245)
        (b 12345))
    (remainder (+ (* a x) b) m)))

(define (random-numbers reqs)
  (define (generate s x)
    (if (stream-null? s)
	the-empty-stream
	(let ((r1 (stream-car s))
	      (r2 (stream-car (stream-cdr s))))
	  (cond ((eq? r1 'generate)
		 (let ((new-x (rand-update x)))
		   (cons-stream
		    new-x
		    (generate (stream-cdr s) new-x))))
		((eq? r1 'reset)
		 (let ((new-x (rand-update r2)))
		   (cons-stream
		    new-x
		    (generate (stream-cdr (stream-cdr s)) new-x))))))))
  (generate reqs 42))

(define reqs
  (cons-stream
   'generate
   (cons-stream
    'generate
    (cons-stream
     'generate
     (cons-stream
      'reset
      (cons-stream
       100
       (cons-stream
	'generate
	(cons-stream
	 'generate
	 (cons-stream
	  'reset
	  (cons-stream
	   42
	   (cons-stream
	    'generate
	    (cons-stream
	     'generate
	     the-empty-stream))))))))))))

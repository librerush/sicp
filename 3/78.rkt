#lang sicp

;; ex 3.78

(#%require "streams.rkt")

(define (integral delayed-integrand initial-value dt)
  (cons-stream
   initial-value
   (let ((integrand (force delayed-integrand)))
     (if (stream-null? integrand)
	 the-empty-stream
	 (integral (delay (stream-cdr integrand))
		   (+ (* dt (stream-car integrand))
		      initial-value)
		   dt)))))

(define (solve-2nd a b dt y0 dy0)
  (define dy
    (integral (delay (add-streams (scale-stream dy a)
				  (scale-stream y b)))
	      dy0
	      dt))
  (define y
    (integral (delay dy) y0 dt))
  y)

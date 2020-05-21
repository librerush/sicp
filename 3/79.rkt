#lang sicp

;; ex 3.79

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

(define (solve-2nd f dt y0 dy0)
  (define dy
    (integral (delay (stream-map f dy y))
	      dy0
	      dt))
  (define y
    (integral (delay dy) y0 dt))
  y)

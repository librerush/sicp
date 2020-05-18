#lang sicp

;; ex 3.73

(#%require "streams.rkt")

(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
		 (add-streams (scale-stream integrand dt)
			      int)))
  int)

(define (RC r c dt)
  (lambda (i v0)
    (add-streams
     (scale-stream i r)
     (integral (scale-stream i (/ 1.0 c)) v0 dt))))

(define RC1 (RC 5 1 0.5))

#lang sicp

;; ex 3.80

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

(define (RLC R L C dt)
  (lambda (vc0 il0)
    (define vc
      (integral (delay (scale-stream il (/ -1 C))) vc0 dt))
    (define il
      (integral (delay (add-streams
			(scale-stream vc (/ 1 L))
			(scale-stream il (/ (- R) L))))
		il0 dt))
    (cons vc il)))

(define rlc1 ((RLC 1 1 0.2 0.1) 10 0))
(define ils (cdr rlc1))
(define vcs (car rlc1))

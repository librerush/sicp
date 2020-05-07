#lang sicp

;; ex 3.64

(#%require "streams.rkt")

(define (average a b)
  (/ (+ a b) 2.0))

(define (sqrt-improve guess x)
  (average guess (/ x guess)))

(define (sqrt-stream x)
  (define guesses
    (cons-stream
     1.0
     (stream-map (lambda (guess) (sqrt-improve guess x))
		 guesses)))
  guesses)

(define (stream-limit s tolerance)
  (define (iter a b rest)
    (if (< (abs (- a b)) tolerance)
	b
	(iter b
	      (stream-car rest)
	      (stream-cdr rest))))
  (iter (stream-car s)
	(stream-car (stream-cdr s))
	(stream-cdr (stream-cdr s))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

#lang sicp

;; ex 3.65

(#%require "streams.rkt")

(define (partial-sums s)
  (define (iter s acc)
    (cons-stream (+ acc (stream-car s))
		 (iter (stream-cdr s) (+ acc (stream-car s)))))
  (iter s 0))

(define (ln-summands n)
  (cons-stream (/ 1.0 n)
	       (stream-map - (ln-summands (+ n 1)))))

(define ln-stream
  (partial-sums (ln-summands 1)))


(define (square x) (* x x))

(define (euler-transform s)
  (let ((s0 (stream-ref s 0))
	(s1 (stream-ref s 1))
	(s2 (stream-ref s 2)))
    (cons-stream (- s2 (/ (square (- s2 s1))
			  (+ s0 (* -2 s1) s2)))
		 (euler-transform (stream-cdr s)))))


(define (make-tableau transform s)
  (cons-stream s (make-tableau transform (transform s))))

(define (accelerated-sequence transform s)
  (stream-map stream-car (make-tableau transform s)))

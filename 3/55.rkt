#lang sicp

;; ex 3.55

(#%require "streams.rkt")

(define (partial-sums s)
  (define (iter s acc)
    (cons-stream (+ acc (stream-car s))
		 (iter (stream-cdr s) (+ acc (stream-car s)))))
  (iter s 0))

#lang sicp

;; ex 3.59

(#%require "streams.rkt")

(#%provide integrate-series
	   exp-series
	   cosine-series
	   sine-series)

(define ones
  (cons-stream 1 ones))

(define (integrate-series ps)
  (stream-map * (stream-map / ones integers) ps))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cosine-series
  (cons-stream 1
	       (scale-stream 
		(integrate-series sine-series)
		-1)))

(define sine-series
  (cons-stream 0
	       (integrate-series cosine-series)))

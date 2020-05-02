#lang sicp

(#%require racket/stream)

(#%provide stream-car
	   stream-cdr)

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

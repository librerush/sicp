#lang sicp

;; ex 3.50

(#%require "streams.rkt")

(define (stream-map proc . argstreams)
  (display argstreams)
  (newline)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
	      (cons proc (map stream-cdr argstreams))))))

#lang sicp

;; ex 3.61

(#%require "streams.rkt")
(#%require "60.rkt")

(#%provide invert-unit-series)

(define (invert-unit-series s)
  (cons-stream
   1
   (stream-map - (mul-series (stream-cdr s)
			     (invert-unit-series s)))))

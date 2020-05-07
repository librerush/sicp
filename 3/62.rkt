#lang sicp

;; ex 3.62

(#%require "streams.rkt")
(#%require "59.rkt")
(#%require "60.rkt")
(#%require "61.rkt")

(#%provide div-series
	   tangent-series)

(define (div-series s1 s2)
  (if (= (stream-car s2) 0)
      (error "a zero constant term")
      (mul-series s1
	       (invert-unit-series s2))))

(define tangent-series
  (div-series sine-series cosine-series))

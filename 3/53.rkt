#lang sicp

;; ex 3.53

(#%require "streams.rkt")

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))

;; (1 2 4 8 16 32 ...)
;; 2^n

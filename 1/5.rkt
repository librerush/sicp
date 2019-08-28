#lang racket

; ex 5

; chezscheme9.5 uses applicative-order evaluation

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))


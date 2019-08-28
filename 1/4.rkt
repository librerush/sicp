#lang racket

; ex 4

; equivalent (+ a (abs b)
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


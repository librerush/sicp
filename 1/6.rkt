#lang racket

; ex 1.6

; infinite loop
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))


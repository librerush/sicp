#lang sicp

; ex 3.1

(define (make-accumulator init-value)
  (lambda (value-to-add)
    (begin (set! init-value (+ init-value value-to-add))
           init-value)))

(define A (make-accumulator 5))

(A 10)
(A 10)

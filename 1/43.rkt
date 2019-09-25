#lang sicp

; ex 1.43

(define square (lambda (x) (* x x)))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (if (= 1 n)
        (f x)
        ((compose f (repeated f (dec n))) x))))

; ((repeated square 2) 5)
; 625


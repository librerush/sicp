#lang sicp

; ex 1.17

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))


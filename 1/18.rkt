#lang sicp

; ex 1.18

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (fast-mult-iter a b)
  (fast-mult-helper a b 0))

(define (fast-mult-helper a b n)
  (cond ((= b 0) n)
        ((even? b) (fast-mult-helper (double a) (halve b) n))
        (else (fast-mult-helper a (- b 1) (+ n a)))))



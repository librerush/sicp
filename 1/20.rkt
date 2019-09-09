#lang sicp

; ex 1.20

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; (gcd 206 40)

; normal-order evaluation
; r = remainder for short
; (gcd 206 40)

; n remainder operations in normal-order

; 4 operations in applicative-order evaluations


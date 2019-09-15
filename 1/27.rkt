#lang sicp

; ex 1.27

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (carmichael-number? n)
  (carmichael-test 2 n))

(define (carmichael-test a n)
  (cond ((= (- n a) 1) true)
        ((= a (expmod a n n)) (carmichael-test (+ 1 a) n))
        (else false)))

; (carmichael-number? 561)
; (carmichael-number? 1105)
; (carmichael-number? 1729)
; (carmichael-number? 2465)
; (carmichael-number? 2821)
; (carmichael-number? 6601)


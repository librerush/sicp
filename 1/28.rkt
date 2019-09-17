#lang sicp

; ex 1.28

(define (square x)
  (* x x))

(define (expmod base exp m)
  ; (ppExp base exp m)  
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (and (and (not (= base 1)) (not (= base (- m 1))))
                  (= (remainder (square base) m) 1))
           0
           (remainder
             (square (expmod base (/ exp 2) m))
             m)))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (not (nontrivial-sqrt? n (expmod a (- n 1) n))))
  (try-it (+ 1 (random (- n 1)))))

(define (nontrivial-sqrt? m a)
  (cond ((= a 0) true)
        ((= (remainder a m) 1) false)
        (else true)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

; pretty printer
(define (ppExp base exp m)
  (display "(expmod ")
  (display base)
  (display " ")
  (display exp)
  (display " ")
  (display m)
  (display ") ")
  (newline))

; this miller-rabin-test sometimes fails

; Carmichael numbers
; (fast-prime? 561 10)
; (fast-prime? 1105 10)
; (fast-prime? 1729 10)
; (fast-prime? 2465 10)
; (fast-prime? 2821 10)
; (fast-prime? 6601 10)

(fast-prime? 2971215073 5)

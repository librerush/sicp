#lang sicp

; ex 1.25

(define (square x)
  (* x x))

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

(define (expmod base exp m)
  (cond ((= exp 0) (ppExp base exp m) 1)
        ((even? exp)
         (ppExp base exp m)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (ppExp base exp m)
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod-two base exp m)
  (display (fast-expt base exp))
  (display " ")
  (display m)
  (newline)
  (remainder (fast-expt base exp) m))

; No, she is wrong. In Alyssa's case (expmod-two) remainder function
; called once (it might be called on big integers). As opposed to expmod-two,
; expmod calls remainder on every step (which reduces a^n number).

; (expmod 3 10 13)

; (expmod-two 3 10 13)



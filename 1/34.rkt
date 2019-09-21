#lang sicp

; ex 1.34

(define square (lambda (x) (* x x)))

(define (f g) (g 2))
 
; (f square)
; (f (lambda (z) (* z (+ z 1))))


; (f f)
; Of course it throws error
; An argument of f expects to be a function from integer to something



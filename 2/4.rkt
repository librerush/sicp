#lang sicp

; ex 2.4

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

; (car (cons 11 22))
; (car (lambda (m) (m 11 22)))
; ((lambda (m) (m 11 22)) (lambda (p q) p))
; ((lambda (p q) p) 11 22)
; 11

; (cdr (cons 11 22))


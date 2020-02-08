#lang sicp

; ex 2.79

(define install-generic-equality
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  ;; interface to rest of the system
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y)))
  (put 'equ? '(rational rational)
       (lambda (x y) (and (= (numer x) (numer y))
                          (= (denom x) (denom y)))))
  (put 'equ? '(complex complex)
       (lambda (x y) (and (= (real-part x) (real-part y))
                          (= (imag-part x) (imag-part y)))))
  'done)

(define (equ? x y) (apply-generic 'equ? x y))

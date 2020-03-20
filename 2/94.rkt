#lang racket

; ex 2.94

(require "91.rkt")
(require "support.rkt")
(require "section-2-5-3.rkt")


(define (remainder-terms t1 t2)
  (cadr (div-terms t1 t2)))

(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (gcd-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- GCD-POLY"
             (list p1 p2))))

(define (greatest-common-divisor x y)
  (cond ((and (number? x) (number? y))
         (gcd x y))
        (else (gcd-poly x y))))


(define p1 (make-polynomial
            'x '((4 1) (3 -1) (2 -2) (1 2))))
(define p2 (make-polynomial 'x '((3 1) (1 -1))))
(greatest-common-divisor p1 p2)

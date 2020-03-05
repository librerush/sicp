#lang racket

; ex 2.88

(require "section-2-5-3.rkt")
(require "support.rkt")

(define foo-poly
  (make-polynomial 'x (list (make-term 2 10)
                            (make-term 1 42))))

(define bar-poly
  (make-polynomial 'x (list (make-term 2 10))))


(define (negate-polynomial p)
  (define (negate t-lst)
    (cond ((empty-termlist? t-lst) (the-empty-termlist))
          (else (adjoin-term
                 (make-term (order (first-term t-lst))
                            (- (coeff (first-term t-lst))))
                 (negate (rest-terms t-lst))))))
  (let ((t-list (term-list p))
        (var (variable p)))
    (make-polynomial var (negate t-list))))

(define (sub-polynomial p1 p2)
  ((get 'add '(polynomial polynomial))
   p1
   (negate-polynomial p2)))

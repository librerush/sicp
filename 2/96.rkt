#lang racket

; ex 2.96

(require "91.rkt")
(require "support.rkt")
(require "section-2-5-3.rkt")


(define (pseudoremainder-terms p q)
  (let ((o1 (order (first-term p)))
        (o2 (order (first-term q)))
        (c (coeff (first-term q))))
    (let ((new-c (expt c (+ 1 (- o1 o2)))))
      (let ((new-p (map (lambda (t)
                          (list (order t)
                                (* new-c (coeff t))))
                        p)))
        (cadr (div-terms new-p q))))))


(define (gcd-terms a b)
  (define (gcd-terms-aux a b)
    (if (empty-termlist? b)
        a
        (gcd-terms-aux b (pseudoremainder-terms a b))))
  (let ((c (gcd-terms-aux a b)))
    (let ((g (apply gcd (map (lambda (t) (coeff t))
                             c))))
      (map (lambda (t)
             (list (order t)
                   (/ (coeff t) g)))
           c))))

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

(define p1
  (make-polynomial 'x '((2 1) (1 -2) (0 1))))

(define p2
  (make-polynomial 'x '((2 11) (0 7))))

(define p3
  (make-polynomial 'x '((1 13) (0 5))))

(let ((q1 (attach-tag 'polynomial (mul-poly p1 p2)))
      (q2 (attach-tag 'polynomial (mul-poly p1 p3))))
  (greatest-common-divisor q1 q2))

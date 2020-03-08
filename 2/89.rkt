#lang racket

; ex 2.89

(require "section-2-5-3.rkt")


(define (make-termlist lst) (list lst))

(define (variable p) (car p))
(define (term-list p) (cadr p))

(define (order term-lst)
  (if (empty-termlist? term-lst)
      (error "empty termlist -- ORDER")
      (- (length term-lst) 1)))

(define a-poly
  (make-poly 'x (make-termlist (list 1 2 0 3 -2 -5))))

(define b-poly
  (make-poly 'x (make-termlist (list 3 -2 -5))))

(define (add-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (make-termlist (add-terms (term-list p1)
                                           (term-list p2))))
      (error "Polys not in same var -- ADD-POLY"
             (list p1 p2))))

(define (add-terms L1 L2)
  (define (add-n-zeros n lst)
    (if (= n 0)
        lst
        (add-n-zeros (- n 1) (cons 0 lst))))
  (let ((ord1 (order L1))
        (ord2 (order L2)))
    (cond ((= ord1 ord2) (map + L1 L2))
          ((> ord1 ord2) (map +
                              L1
                              (add-n-zeros (- ord1 ord2) L2)))
          (else (map +
                     (add-n-zeros (- ord2 ord1) L1)
                     L2)))))

(add-poly a-poly b-poly)

#lang racket

; ex 2.91

(require "support.rkt")
(require "section-2-5-3.rkt")


;; from 2.88 exercise
(define (negate t-lst)
  (cond ((empty-termlist? t-lst) (the-empty-termlist))
        (else (adjoin-term
               (make-term (order (first-term t-lst))
                          (- (coeff (first-term t-lst))))
               (negate (rest-terms t-lst))))))

(define (sub-terms L1 L2)
  (add-terms L1 (negate L2)))


(define a-poly
  (make-polynomial 'x (list (make-term 5 1)
                            (make-term 0 -1))))

(define b-poly
  (make-polynomial 'x (list (make-term 2 1)
                            (make-term 0 -1))))


(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (div-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- DIV-POLY"
             (list p1 p2))))


(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
            (let ((new-c (/ (coeff t1) (coeff t2)))
                  (new-o (- (order t1) (order t2))))
              (let ((rest-of-result
                     (div-terms (sub-terms L1
                                           (mul-terms
                                            (list (make-term new-o new-c))
                                            L2))
                                L2)))
                (list (adjoin-term (make-term new-o new-c)
                                   (car rest-of-result))
                      (cadr rest-of-result))))))))

(div-poly a-poly b-poly)

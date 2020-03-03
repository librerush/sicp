#lang sicp

; ex 2.87

(define (install-polynomial-package)
  (define (polynomial? p)
    (and (variable? (variable p))
         (list? (term-list p))))

  (define (=zero? p)
    (let ((t-list (term-list p)))
      (if (empty-termlist? t-list)
          true
          (and (=zero? (coeff (first-term t-list)))
               (=zero? (rest-terms t-list))))))

  (put '=zero? '(polynomial)
       (lambda (p) (=zero? p))))

#lang sicp

; ex 2.61

(define (adjoin-set x set)
  (if (null? set) (cons x set)
      (let ((x0 (car set)))
        (cond ((< x x0) (cons x set))
              ((> x x0) (cons x0 (adjoin-set x (cdr set))))
              (else set)))))


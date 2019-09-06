#lang sicp

; ex 1.16

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x)
  (* x x))

(define (fast-expt-iter b n)
  (define (ifast-expt b n a)
    (cond ((= n 0) a)
          ((even? n) (ifast-expt (square b) (/ n 2) 
                                 a))
          (else (ifast-expt b (- n 1) (* a b)))))
  (ifast-expt b n 1))



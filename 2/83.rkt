#lang sicp

; ex 2.83

(define (raise x) (apply-generic 'raise x))

(define (install-integer-package)
  (define (raise x)
    (make-rational x 1))
  (put 'raise (integer)
       (lambda (x) (raise x)))
  'done)

(define (install-rational-package)
  (define (raise x)
    (/ (numer x) (denom x)))
  (put 'raise (rational)
       (lambda (x) (raise x)))
  'done)

(define (install-real-package)
  (define (raise x)
    (make-complex-from-real-imag x 0))
  (put 'raise (real)
       (lambda (x) (raise x)))
  'done)

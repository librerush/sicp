#lang sicp

; ex 2.80

(define (install-scheme-number-package)
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0))))

(define (install-rational-package)
  (define (numer x) (car x))
  (put '=zero? '(rational)
       (lambda (x) (= (numer x) 0))))

(define (install-complex-package)
  (put '=zero? '(complex)
       (lambda (x) (and (= (real-part x) 0)
                        (= (imag-part x) 0)))))

(define (=zero? x) (apply-generic '=zero? x))

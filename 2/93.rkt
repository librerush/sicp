#lang racket

; ex 2.93

(require "section-2-5-3.rkt")
(require "support.rkt")


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (displayln type-tags)
      (if proc
          (apply proc (map contents args))
          (error
            "No method for these types -- APPLY-GENERIC"
            (list op type-tags))))))


;;;SECTION 2.5.1

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (install-rational-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cadr x))
  (define (make-rat n d)
        (list n d))
  (define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))

  (define (add-rf x y)
    (let ((n1 (car x))
          (d1 (cadr x))
          (n2 (car y))
          (d2 (cadr y))
          (v (variable (car x))))
      (list (attach-tag 'polynomial
                        (add-poly (attach-tag 'polynomial (mul-poly n1 d2))
                                  (attach-tag 'polynomial (mul-poly n2 d1))))
            (attach-tag 'polynomial (mul-poly d1 d2)))))
  ;; interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))
  (put 'add '(rf rf)
       (lambda (x y) (attach-tag 'rf (add-rf x y))))
  (put 'make 'rational
       (lambda (n d) (if (eq? (type-tag n) 'polynomial)
                         (attach-tag 'rf (make-rat n d))
                         (tag (make-rat n d)))))
  'done)

(install-rational-package)

(define (make-rational n d)
  ((get 'make 'rational) n d))



(define p1 (make-polynomial 'x '((2 1) (0 1))))
(define p2 (make-polynomial 'x '((3 1) (0 1))))
(define rf (make-rational p2 p1))

(add rf rf)

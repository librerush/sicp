#lang sicp

; ex 2.12

(define (make-interval a b)
  (cons a b))

(define (upper-bound z)
  (cdr z))

(define (lower-bound z)
  (car z))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((to-percent (* c (/ p 100))))
    (make-interval (- c to-percent) (+ c to-percent))))

(define (percent i)
  (* 100 (/ (- (upper-bound i) (lower-bound i))
            (+ (upper-bound i) (lower-bound i)))))

(define some-interval
  (make-center-percent 5.0 56))

; (percent some-interval)





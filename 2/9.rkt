#lang sicp

; ex 2.9

(define (make-interval a b)
  (cons a b))

(define (upper-bound z)
  (cdr z))

(define (lower-bound z)
  (car z))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (let ((minus-y (make-interval (- (lower-bound y))
                                (- (upper-bound y)))))
    (add-interval x minus-y)))


(define (width x)
  (/ (abs (- (upper-bound x) (lower-bound x))) 2))

(define (width-sum x y)
  (+ (width x) (width y)))

(define (width-diff x y)
  (- (width x) (width y)))


        

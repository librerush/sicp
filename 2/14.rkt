#lang sicp

; ex 2.14

(define (make-interval a b)
  (cons a b))

(define (upper-bound z)
  (cdr z))

(define (lower-bound z)
  (car z))

(define (print-interval z)
  (display "(")
  (display (lower-bound z))
  (display ",")
  (display (upper-bound z))
  (display ")")
  (newline))

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
  (if (or (>= 0 (upper-bound y)) (>= 0 (lower-bound y)))
      (error "interval spans zero " y)
      (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))

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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one
      (add-interval (div-interval one r1)
                    (div-interval one r2)))))

(define a-interval
  (make-interval 21.0 42.0))

(define b-interval
  (make-center-width 6.0 4.0))

; (print-interval a-interval)
; (print-interval b-interval)
; (print-interval (div-interval a-interval a-interval))
; (print-interval (div-interval a-interval b-interval))


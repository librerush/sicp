#lang sicp

; ex 2.2

(define (average x y)
  (/ (+ x y) 2.0))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment x y)
  (cons x y))

(define (start-segment line)
  (car line))

(define (end-segment line)
  (cdr line))

(define (midpoint-segment line)
  (let ((x1 (x-point (start-segment line)))
        (x2 (x-point (end-segment line)))
        (y1 (y-point (start-segment line)))
        (y2 (y-point (end-segment line))))
    (make-point (average x1 x2) (average y1 y2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define some-line
  (make-segment (make-point 2 3) (make-point 8 6)))

; (print-point (midpoint-segment some-line))
; (5.0,4.5)


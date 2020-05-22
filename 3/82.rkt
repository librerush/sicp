#lang sicp

;; ex 3.82

(#%require "streams.rkt")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (P point)
    (let ((circle (make-circle 0.0 0.0 1.0)))
      (in-circle? (car point) (cdr point) circle)))

(define (estimate-integral P x1 x2 y1 y2)
  (define (point) (random-point x1 x2 y1 y2))
  (define (random-points p)
    (cons-stream
     (P (p))
     (random-points p)))
  (let ((area (* (- x2 x1)
                 (- y2 y1))))
    (stream-map
     (lambda (p) (* p area))
     (monte-carlo (random-points point) 0 0))))

(define (square x) (* x x))

(define (make-circle x y radius) (list x y radius))

(define (in-circle? x y circle)
  (let ((x1 (car circle))
        (y1 (cadr circle))
        (radius (caddr circle)))
    (<= (+ (square (- x x1))
           (square (- y y1)))
        (square radius))))

(define (random-point x1 x2 y1 y2)
  (let ((x (random-in-range x1 x2))
        (y (random-in-range y1 y2)))
    (cons x y)))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
      (stream-cdr experiment-stream) passed failed)))
  (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
      (next passed (+ failed 1))))

(define pi
  (estimate-integral P -1.0 1.0 -1.0 1.0))

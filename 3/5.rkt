#lang sicp

; ex 3.5


(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (P f)
  (lambda ()
    (let ((circle (make-circle 0.0 0.0 1.0))
          (p (f)))
      (in-circle? (car p) (cdr p) circle))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (point) (random-point x1 x2 y1 y2))
  (let ((area (* (- x2 x1)
                 (- y2 y1))))
    (* area (monte-carlo trials (P point)))))

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

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

;; (estimate-integral P -1.0 1.0 -1.0 1.0 500000)

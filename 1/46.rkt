#lang sicp

; ex 1.46

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (iterative-improve good-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          guess
          (try next))))
  (lambda (x) (try x)))

(define (sqrt x)
  ((iterative-improve
     (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
     (lambda (i) (average i (/ x i))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (v1 v2) (< (abs (- v1 v2)) tolerance))
    f) first-guess))

(fixed-point cos 1.0)
(sqrt 9)

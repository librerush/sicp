#lang racket

; ex 1.3 

(define (sumnsquare a b)
  (+ (* a a) (* b b)))

(define (sumOfSquareLarge x y z)
  (cond  ((and (>= x y) (>= x z)) (sumnsquare x (if (> y z) y z)))
         ((and (>= y x) (>= y z)) (sumnsquare y (if (> x z) x z)))
         ((and (>= z x) (>= z y)) (sumnsquare z (if (> x y) x y)))
         ))


#lang sicp

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (g x)
    (cond ((or (= x 0) (= x n)) (y x))
          ((odd? x) (* 4.0 (y x)))
          (else (* 2.0 (y x))))) 
  (* (/ h 3.0) (sum g 0 inc n)))


; (simpsons-rule cube 0 1 100)
; (simpsons-rule cube 0 1 1000)
; (integral cube 0 1 0.001)

; 0.24999999999999992
; 0.2500000000000002
; 0.249999875000001



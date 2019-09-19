#lang sicp

; ex 1.30

(define (cube x) (* x x x))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (g x)
    (cond ((or (= x 0) (= x n)) (y x))
          ((odd? x) (* 4.0 (y x)))
          (else (* 2.0 (y x))))) 
  (* (/ h 3.0) (sum g 0 inc n)))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

; (simpsons-rule cube 0 1 100)
; (simpsons-rule cube 0 1 1000)




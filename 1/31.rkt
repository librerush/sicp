#lang sicp

; ex 1.31

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (iter (next x) (* result (term x)))))
  (iter a 1))

(define (identity x) x)

(define (factorial n)
  (product-iter identity 1 inc n))


(define (square x) (* x x))

(define (evens-term x)
  (if (= x 1) 2 (square (* 2 x))))

(define (odds-term x)
  (square (inc (* 2 x))))

(define (pi-product n)
  (define evens-product
    (product-iter evens-term 1 inc n))
  (define odds-product
    (product-iter odds-term 1 inc (dec n)))
  (* 4.0 (/ (/ evens-product (* 2 n)) odds-product)))

; (factorial 5)
; (pi-product 100)



#lang sicp

;; ex 4.19

(let ((a 1))
  (define (f x)
    (define b (+ a x))
    (define a 5)
    (+ a b))
  (f 10))


;; I support Alyssa's view. I think it's more efficient
;; and straight way.

;; We need to scan all definitions under same procedure and
;; substitute.

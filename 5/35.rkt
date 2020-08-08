#lang sicp

;; ex 5.35

(compile '(define (f x) (+ x (g (+ x 2)))) 'val 'next)

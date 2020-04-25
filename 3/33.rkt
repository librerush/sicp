#lang sicp

;; ex 3.33

(#%require "constraints.rkt")

(define (averager a b c)
  (let ((s (make-connector))
	(t (make-connector)))
    (adder a b s)
    (constant (/ 1.0 2.0) t)
    (multiplier s t c)))

;; (define a (make-connector))
;; (define b (make-connector))
;; (define c (make-connector))
;; (probe "a" a)
;; (probe "b" b)
;; (probe "c" c)
;; (set-value! a 4 'user)
;; (set-value! b 6 'user)
;; (averager a b c)

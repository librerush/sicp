#lang sicp

;; ex 3.34

(#%require "constraints.rkt")

(define (squarer a b)
  (multiplier a a b))


;; counterexample
;; (define a (make-connector))
;; (define b (make-connector))

;; (probe "a" a)
;; (probe "b" b)
;; (set-value! b 4 'user)
;; (squarer a b)

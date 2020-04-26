#lang sicp

;; ex 3.38


;; Peter
(set! balance (+ balance 10))
;; Paul
(set! balance (- balance 20))
;; Mary
(set! balance (- balance (/ balance 2)))

;; a.
;; A set of all permutations
;; {45, 35, 50, 40}

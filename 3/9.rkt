#lang sicp

; ex 3.9

;; recursive version

;; global env  -->  (                                                                                ... )
;;                   |                          |                          |                         |
;; (factorial 6)   E1 -> n:6                  E2 -> n:5                  E3 -> n:4                  E7 -> n:1
;;                 (* n (factorial (- n 1)))  (* n (factorial (- n 1)))  (* n (factorial (- n 1)))  1


;; iterative version

;; global env  --> (                                                                             ...)
;;                  |                  |                                                         ...
;; (factorial 6)   E1 -> n:6          E2 -> product:1 counter:1 max-count:6
;;                 (fact-iter 1 1 n)  (fact-iter (* counter product) (+ counter 1) max-count)

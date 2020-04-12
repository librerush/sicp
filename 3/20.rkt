#lang sicp

;; ex 3.20

(define x (cons 1 2))
(define z (cons x x))
(set-car! (cdr z) 17)
(car x)

;; global env -->  x         z
;;                 :         :
;;             17 --> 2     . .
;;              :           : :
;;              ------------:-:

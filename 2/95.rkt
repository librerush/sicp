#lang racket

; ex 2.95

(require "section-2-5-3.rkt")
(require "94.rkt")


(define p1
  (make-polynomial 'x '((2 1) (1 -2) (0 1))))

(define p2
  (make-polynomial 'x '((2 11) (0 7))))

(define p3
  (make-polynomial 'x '((1 13) (0 5))))

;; (let ((q1 (attach-tag 'polynomial (mul-poly p1 p2)))
;;       (q2 (attach-tag 'polynomial (mul-poly p1 p3))))
;;   (greatest-common-divisor q1 q2))

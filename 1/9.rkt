#lang racket

; ex 1.9
(define (inc x)
  (+ 1 x))

(define (dec x)
  (- x 1))
; recursive process
; (define (+ a b) 
;   (if (= a 0) b (inc (+ (dec a) b))))
; iterative process
; (define (+ a b)
;   (if (= a 0) b (+ (dec a) (inc b))))


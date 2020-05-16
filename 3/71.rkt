#lang sicp

;; ex 3.71

(#%require "streams.rkt")
(#%require "70.rkt")

(define (cube x) (* x x x))

(define (weight x)
    (+ (cube (car x)) (cube (cadr x))))

(define s
  (weighted-pairs integers integers weight))

(define (traverse e1 s)
  (let ((e2 (stream-car s)))
    (let ((w1 (weight e1))
	  (w2 (weight e2)))
      (cond ((< w1 w2) (traverse e2 (stream-cdr s)))
	    ((= w1 w2) (cons-stream
			w1
			(traverse (stream-car s) (stream-cdr s))))
	    (else (traverse e1 (stream-cdr s)))))))

(define ramanujan-numbers
  (traverse (stream-car s) (stream-cdr s)))

;; 1729
;; 4104
;; 13832
;; 20683
;; 32832
;; 39312

#lang sicp

;; ex 3.71

(#%require "streams.rkt")
(#%require "70.rkt")

(define (square x) (* x x))

(define (weight x)
  (+ (square (car x)) (square (cadr x))))

(define s
  (weighted-pairs integers integers weight))

(define (traverse e1 s w)
  (let ((e2 (stream-car s)))
    (let ((w1 (weight e1))
	  (w2 (weight e2)))
      (cond ((< w1 w2)
	     (traverse e2 (stream-cdr s) w))
	    ((= w1 w2)
	     (if (= w1 w)
		 (cons-stream w1
			      (traverse e2 (stream-cdr s) w))
		 (traverse e2 (stream-cdr s) w1)))
	    (else
	     (traverse e1 (stream-cdr s) w))))))

(define sum-of-two-squares
  (traverse (stream-car s) (stream-cdr s) 0))

;; 325
;; 425
;; 650
;; 725
;; 845

#lang sicp

;; ex 3.66

(#%require "streams.rkt")

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
		(stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

;; How many pairs precede the pair?
;; (1, 100)
;; 197
;; (99, 100)
;; 950737950171172051122527404030
;; (100, 100)
;; 1267650600228229401496703205374

;; procedure for computing previous pairs quantity
(define (previous-pairs a b)
  (if (= a b)
      (- (expt 2 a) 2)
      (let ((c (- (expt 2 a) 2))
	    (d (expt 2 (- a 1))))
	(+ c d (* 2 d (- b a 1))))))

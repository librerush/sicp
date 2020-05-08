#lang sicp

;; ex 3.67

(#%require "streams.rkt")

;; old one
;; (define (interleave s1 s2 s3)
;;   (if (stream-null? s1)
;;       s2
;;       (cons-stream (stream-car s1)
;; 		   (interleave s2 s3 (stream-cdr s1)))))

;; (define (pairs s t)
;;   (cons-stream
;;    (list (stream-car s) (stream-car t))
;;    (interleave
;;     (stream-map (lambda (x) (list (stream-car s) x))
;; 		(stream-cdr t))
;;     (stream-map (lambda (x) (list x (stream-car t)))
;; 		(stream-cdr s))
;;     (pairs (stream-cdr s) (stream-cdr t)))))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
		   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (interleave (stream-map (lambda (x) (list (stream-car s) x))
			    (stream-cdr t))
		(stream-map (lambda (x) (list x (stream-car t)))
			    (stream-cdr s)))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (pairs->list n)
  (let ((int-pairs (pairs integers integers)))
    (define (iter i)
      (if (> i n)
	  '()
	  (cons (stream-ref int-pairs i)
		(iter (+ i 1)))))
    (iter 0)))

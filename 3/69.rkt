#lang sicp

;; ex 3.69

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

(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (stream-map (lambda (x) (cons (stream-car s) x))
		(pairs t (stream-cdr u)))
    (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define triples-stream (triples integers integers integers))

(define pythagorean-triples
  (stream-filter
   (lambda (x)
     (let ((i (car x))
	   (j (cadr x))
	   (k (caddr x)))
       (= (+ (* i i) (* j j)) (* k k))))
   triples-stream))

(define (stream->list s n)
  (define (iter i)
    (if (> i n)
	'()
	(cons (stream-ref s i)
	      (iter (+ i 1)))))
  (iter 0))

;; (stream->list pythagorean-triples 5)

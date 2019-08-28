#lang racket

; ex 1.11
(define (f-recur n)
  (cond ((< n 3) n)
	(else (+ (f-recur (- n 1))
		 (* 2 (f-recur (- n 2)))
		 (* 3 (f-recur (- n 3)))))))

(define (f-iter n)
  (define (g a b c n)
    (cond ((> 3 n) a)
	  (else (g (+ a (* 2 b) (* 3 c)) a b (- n 1)))))
  (if (> 3 n) n (g 2 1 0 n)))


;#lang racket

(load "../some-funcs.scm")

(define (applyTwo g x)
  (g (g x)))

(define (** x n)
    (exp (* n (log x))))

(define phi (/ (+ 1 (sqrt 5)) 2))

(define (fib n)
  (/ (^ phi n) (sqrt 5)))


(define (count-change amount) (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ (cc amount
		     (- kinds-of-coins 1))
		 (cc (- amount
			(first-denomination
			 kinds-of-coins))
		     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))



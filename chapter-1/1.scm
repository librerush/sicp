; Exercise 1.*

(load "shit.scm")
; ex 1.3
(define (sumnsquare a b)
  (+ (* a a) (* b b)))

(define (sumOfSquareLarge x y z)
  (cond  ((>= x y z) (sumnsquare x y))
	 ((>= y z x) (sumnsquare y z))
	 ((>= z x y) (sumnsquare z x))
	 ((>= x z y) (sumnsquare x z))
	 ((>= z y x) (sumnsquare z y))
	 ((>= y x z) (sumnsquare y x))
	 ))

; ex 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; ex 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))


; ex 1.7
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define epsilon 0.001)

(define (sqrt-iter guess x)
;  (display guess) (newline)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (> epsilon (abs (- guess x))))


(define (square x)
  (* x x))

; ex 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

; ex 1.8
(define (cubeRoot x)
  (cubeIter 1.0 x))

(define (cubeIter guess x)
  (if (goodEnough? guess (improveCube guess x))
      guess
      (cubeIter (improveCube guess x) x)))

(define (goodEnough? guess x)
  (> epsilon (abs (- guess x))))

(define (improveCube guess x)
  (cubeAvg (* 2 guess) (/ x (square guess))))

(define (cubeAvg x y)
  (/ (+ x  y) 3))

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

; ex 1.10
(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1) (A x (- y 1))))))

; f n = 2 * n
;(define (f n) (A 0 n))
; g n = 2 ^ n
;(define (g n) (A 1 n))
; h n = 2 ^ (h (n - 1))
;(define (h n) (A 2 n))
;(define (k n) (* 5 n n))


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

; ex 1.12
(define (pascal row col)
  (if (or (= col 1) (= col row))
      1
      (+ (pascal (- row 1) col)
	 (pascal (- row 1) (- col 1)))))


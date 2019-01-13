; Square Roots by Newton's Method

(define (applyTwo f x)
  (f (f x)))

; ---------------------

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
  (define (goodEnough? guess x)
    (> epsilon (abs (- guess x))))
  (define (improveCube guess x)
    (cubeAvg (* 2 guess) (/ x (square guess))))
  (define (cubeAvg x y)
    (/ (+ x  y) 3))
  (define (cubeIter guess x)
    (if (goodEnough? guess (improveCube guess x))
	guess
	(cubeIter (improveCube guess x) x)))
  (cubeIter 1.0 x))


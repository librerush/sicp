; ex 1.7

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define epsilon 0.001)

(define (sqrt-iter guess x)
  ;(display guess) (newline)
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


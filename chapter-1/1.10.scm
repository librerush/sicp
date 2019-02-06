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



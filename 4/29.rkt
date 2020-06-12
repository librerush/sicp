#lang sicp

;; ex 4.29

(define repeat
  (lambda (e n)
    (if (= n 1)
        (list e)
        (cons e (repeat e (- n 1))))))

(define map
  (lambda (f l)
    (if (null? l)
        l
        (cons (f (car l)) (map f (cdr l))))))

(map (lambda (x) (* x 0.5)) (repeat 13 10000))

;; (square (id 10))
;; 100

;; count
;; with memoization -> 1
;; without memoization -> 2

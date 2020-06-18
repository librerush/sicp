#lang sicp

;; ex 4.36

(define (require p)
  (if (not p)
      (amb)))

(define (an-integer-between low high)
  (require (>= high low))
  (amb low (an-integer-between (+ low 1) high)))

(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

(define (a-pythagorean-triple low)
  (let ((k (an-integer-starting-from low)))
    (let ((j (an-integer-between low k)))
      (let ((i (an-integer-between low j)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

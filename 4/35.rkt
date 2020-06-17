#lang sicp

;; ex 4.35

(define (require p)
  (if (not p)
      (amb)))

(define (an-integer-between low high)
  (require (>= high low))
  (amb low (an-integer-between (+ low 1) high)))

(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high)))
    (let ((j (an-integer-between i high)))
      (let ((k (an-integer-between j high)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))

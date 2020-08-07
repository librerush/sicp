#lang sicp

;; ex 5.33

(define (factorial-alt n)
  (if (= n 1)
      1
      (* n (factorial-alt (- n 1)))))

;; Difference in evaluating: (* n (factorial-alt (- n 1)))
;; This program is not more efficient than the other.

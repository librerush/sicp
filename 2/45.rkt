#lang sicp
(#%require sicp-pict)

; ex 2.45

(define (split v w)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split v w) painter (- n 1))))
          (v painter (w smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))



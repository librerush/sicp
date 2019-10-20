#lang sicp
(#%require sicp-pict)

; ex 2.44

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

; (paint (up-split wave 3)) 



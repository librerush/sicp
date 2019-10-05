#lang sicp

; ex 2.17

(define (last-pair l)
  (if (= 1 (length l))
      (car l)
      (last-pair (cdr l))))

; (last-pair (list 23 72 149 34))
; 34


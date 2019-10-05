#lang sicp

; ex 2.18

(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))

; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)


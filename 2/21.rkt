#lang sicp

; ex 2.21

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-via-map items)
  (map square items))

; (square-list (list 1 2 3 4))
; (square-list-via-map (list 1 2 3 4))



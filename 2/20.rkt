#lang sicp

; ex 2.20

(define (filter-list predicate l)
  (if (null? l)
      l
      (if (predicate (car l))
          (cons (car l) (filter-list predicate (cdr l)))
          (filter-list predicate (cdr l)))))

(define (same-parity a . l)
  (if (null? l)
      (list a)
      (if (even? a)
          (cons a (filter-list even? l))
          (cons a (filter-list odd? l)))))
          
; (same-parity 1 2 3 4 5 6 7)
; (same-parity 2 3 4 5 6 7)



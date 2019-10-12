#lang sicp

; ex 2.30

(define (square x) (* x x))

(define (square-tree-via-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-via-map sub-tree)
             (square sub-tree)))
       tree))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))


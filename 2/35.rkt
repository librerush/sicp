#lang sicp

; ex 2.35

(define (enumerate-tree l)
  (cond ((null? l) nil)
        ((not (pair? l)) (list l))
        (else (append (enumerate-tree (car l))
                      (enumerate-tree (cdr l))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y)) 0
              (map (lambda (x) x) (enumerate-tree t))))

; (count-leaves (cons (list 1 2) (list 3 (list 5 6) 4)))

; we also can solve it using recursion in count-leaves



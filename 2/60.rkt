#lang sicp

; ex 2.60

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoint-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set s1 s2)
  (let ((set1 (list->unique-list s1))
        (set2 (list->unique-list s2))) 
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)
           (cons (car set1) (intersection-set (cdr set1) set2)))
          (else (intersection-set (cdr set1) set2)))))

(define (union-set s1 s2)
  (let ((set1 (list->unique-list s1))
        (set2 (list->unique-list s2)))
    (cond ((null? set1) set2)
        ((null? set2) set1)
        ((not (element-of-set? (car set1) set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        (else (union-set (cdr set1) set2)))))

; runs in O(n) time
(define (list->unique-list l)
  (fold-right (lambda (x y)
                 (cons x (filter (lambda (z)
                                   (not (equal? z x))) y)))
              '() l)) 


; (union-set (list 2 3 2 1 3 2 2) (list 6 0 6))
; (2 3 1 6 0)


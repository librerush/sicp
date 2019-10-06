#lang sicp

; ex 2.22

(define (square x) (* x x))

(define (square-list-v1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things)) ; reverse magic happens here
                    answer))))
  (iter items nil))

(define (square-list-v2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; (square-list-v2 (list 1 2 3 4))

; first procedure works (cons b (cons a '()))
; second procedure works (cons (cons '() a) b))


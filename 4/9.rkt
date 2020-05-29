#lang sicp

;; ex 4.9

(define (find-and-replace id value body)
  (cond ((null? body) '())
        ((and (symbol? body) (eq? id body))
         value)
        ((pair? body)
         (cons (find-and-replace id value (car body))
               (find-and-replace id value (cdr body))))
        (else body)))

(define (for id n body)
  (define (iter i)
    (if (< i n)
        (cons
         (find-and-replace id i body)
         (iter (+ i 1)))
        '()))
  (make-begin (iter 0)))

;; (for 'i 10 '(display (* i (+ i 1))))

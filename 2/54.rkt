#lang sicp

; ex 2.54

(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) true)
        ((not (= (length list1) (length list2))) false)
        (else (and (let ((l1 (car list1))
                         (l2 (car list2)))
                     (if (and (pair? l1) (pair? l2))
                         (equal? l1 l2)
                         (eq? l1 l2)))
                   (equal? (cdr list1) (cdr list2))))))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))



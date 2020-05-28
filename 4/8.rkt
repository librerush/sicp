#lang sicp

;; ex 4.8

(define (let->combination exp)
  (if (named-let? exp)
      (named-let exp)
      (make-application
       (make-lambda
        (map car (car exp))
        (cdr exp))
       (map cadr (car exp)))))

(define (named-let? exp)
  (variable? (car exp)))

(define (named-let exp)
  (list 'begin
        (cons 'define
              (cons (cons (car exp) (map car (cadr exp)))
                    (cddr exp)))
        (cons (car exp) (map cadr (cadr exp)))))

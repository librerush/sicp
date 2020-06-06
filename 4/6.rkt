#lang sicp

;; ex 4.6

(define (let->combination exp env)
  (apply
   (make-procedure
    (map car (car exp))
    (cdr exp)
    env)
   (map cadr (car exp))))

(define (eval-let exp env)
  (let->combination (cdr exp) env))

(define (let? exp) (tagged-list? exp 'let))

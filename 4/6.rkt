#lang sicp

;; ex 4.6

(define (let->combination exp)
  (make-application
   (make-lambda
    (map car (car exp))
    (cdr exp))
   (map cadr (car exp))))

(define (eval-let exp env)
  (eval (let->combination (cdr exp)) env))

(define (let? exp) (tagged-list? exp 'let))

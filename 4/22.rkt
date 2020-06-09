#lang sicp

;; ex 4.22

(define (let? exp)
  (tagged-list? exp 'let))

(define (let->combination exp env)
  ((analyze-application
    (cons
     (make-lambda
      (map car (car exp))
      (cdr exp))
     (map cadr (car exp))))
   env))

(define (analyze-let exp)
  (lambda (env)
    (let->combination (cdr exp) env)))

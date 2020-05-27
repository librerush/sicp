#lang sicp

;; ex 4.6

(define (let->combination exp env)
  (eval (make-application
         (make-lambda
          (map car (cadr exp))
          (cddr exp))
         (map cadr (cadr exp)))
        env))

(define (let? exp) (tagged-list? exp 'let))

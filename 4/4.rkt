#lang sicp

;; ex 4.4

(define (eval-and exp env)
  (cond ((no-operands? exp)
         true)
        ((eval (first-operand exp) env)
         (eval-and (rest-operands exp) env))
        (else false)))

(define (eval-or exp env)
  (cond ((no-operands? exp)
         false)
        ((eval (first-operand exp) env)
         true)
        (else
         (eval-or (rest-operands exp) env))))

(put 'eval 'and eval-and)
(put 'eval 'or eval-or)

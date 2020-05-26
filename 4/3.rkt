#lang sicp

;; ex 4.3

(#%require "../2/support.rkt")

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
	((variable? exp) (lookup-variable-value exp env))
       	((not (null? (get 'eval (operator))))
	 ((get 'eval (operator exp))
	  exp env))
	((application? exp)
	 (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
	(else
         (error "Unknown expression type -- EVAL" exp))))

(define (install-eval-package)
  ;; internal procedures
  (define (quote-def exp env)
    (text-of-quotation exp))
  (define (lambda-def exp env)
    (make-procedure (lambda-parameters exp)
		    (lambda-body exp)
		    env))
  (define (begin-def exp env)
    (eval-sequence (begin-actions exp) env))
  (define (cond-def exp env)
    (eval (cond->if exp) env))
  (put 'eval 'quote quote-def)
  (put 'eval 'set! eval-assignment)
  (put 'eval 'define eval-definition)
  (put 'eval 'if eval-if)
  (put 'eval 'lambda lamba-def)
  (put 'eval 'begin begin-def)
  (put 'eval 'cond cond-def)
  'done)

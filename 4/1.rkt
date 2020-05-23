#lang sicp

;; ex 4.1

(define (list-of-values-left exps env)
  (if (no-operands? exps)
      '()
      (let ((first (eval (first-operand exps) env)))
	(let ((rest (list-of-values (rest-operands exps) env)))
	  (cons first
		rest)))))

(define (list-of-values-right exps env)
  (if (no-operands? exps)
      '()
      (let ((rest (list-of-values (rest-operands exps) env)))
	(let ((first (eval (first-operand exps) env)))
	  (cons first
		rest)))))

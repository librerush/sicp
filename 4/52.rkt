#lang sicp

;; ex 4.52

(define (if-fail? exp)
  (tagged-list? exp 'if-fail))

(define (analyze-if-fail exp)
  (let ((exp1 (analyze (cadr exp)))
        (exp2 (analyze (caddr exp))))
    (lambda (env succeed fail)
      (exp1
       env
       succeed
       (lambda ()
         (exp2 env succeed fail))))))

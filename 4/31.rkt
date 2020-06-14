#lang sicp

;; ex 4.31

;; implemented with only memoization

(define (type-of-parameter exp)
  (cond ((and (pair? exp)
              (or (eq? (cadr exp) 'lazy)
                  (eq? (cadr exp) 'lazy-memo)))
         delay-it)
        (else
         actual-value)))

(define (list-of-args parameters exps env)
  (if (no-operands? exps)
      '()
      (cons ((type-of-parameter (first-operand parameters))
             (first-operand exps) env)
            (list-of-args (rest-operands parameters)
                          (rest-operands exps)
                          env))))

(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
          (list-of-arg-values arguments env))) ; changed
        ((compound-procedure? procedure)
         (eval-sequence
          (procedure-body procedure)
          (extend-environment
           (procedure-parameters procedure)   ; changed
           (list-of-args
            (procedure-parameters procedure)
            arguments
            env)
           (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))

(define f
  (lambda (x (y lazy-memo))
    42))

;; (f 13 (/ 1 0))
;; 42
;; (f (/ 1 0) 10)
;; error

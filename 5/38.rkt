#lang sicp

;; ex 5.38

;; Inefficient implementation without arbitrary number of operands.

;; Could be rewritten using preserving procedure.
(define (spread-arguments operands)
  (append-instruction-sequences
   (compile (car operands) 'arg1 'next)
   (make-instruction-sequence
    '() '() '((save arg1)))
   (compile (cadr operands) 'arg2 'next)
   (make-instruction-sequence
    '() '() '((restore arg1)))))

(define (primitive-proc? exp)
  (and (pair? exp)
       (memq (operator exp) '(= * - +))))

(define (compile-prim-proc exp target linkage)
  (end-with-linkage
   linkage
   (preserving
    '(env)
    (spread-arguments (operands exp))
    (make-instruction-sequence
     '(arg1 arg2) `(,target)
     `((assign ,target (op ,(operator exp)) (reg arg1) (reg arg2)))))))

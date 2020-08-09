#lang sicp

;; ex 5.36

;; Inefficient implementation (runtime reverse).

(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg
         (preserving '(argl)
          (car operand-codes)
          (make-instruction-sequence '(val argl) '(argl)
           '((assign argl
              (op cons) (reg val) (reg argl)))))))
    (if (null? (cdr operand-codes))
        (append-instruction-sequences
         code-for-next-arg
         (make-instruction-sequence
          '() '(argl)
          '((assign argl (op reverse) (reg argl))))) ;; *
        (preserving '(env)
         code-for-next-arg
         (code-to-get-rest-args (cdr operand-codes))))))

(define (construct-arglist operand-codes)
  (cond ((null? operand-codes)
         (make-instruction-sequence
          '() '(argl)
          '((assign argl (const ())))))
        ((null? (cdr operand-codes))
         (append-instruction-sequences
          (car operand-codes)
          (make-instruction-sequence
           '(val) '(argl)
           '((assign argl (op list) (reg val))))))
        (else
         (preserving
          '(env)
          (append-instruction-sequences
           (car operand-codes)
           (make-instruction-sequence
            '(val) '(argl)
            '((assign argl (op list) (reg val)))))
          (code-to-get-rest-args (cdr operand-codes))))))

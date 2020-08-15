#lang sicp

;; ex 5.42

(define (compile-variable exp target linkage ct-env)
  (end-with-linkage
   linkage
   (let ((lex-address (find-variable exp ct-env)))
     (if (eq? 'not-found lex-address)
         (make-instruction-sequence
          '(env) (list target)
          `((assign ,target
                    (op lookup-variable-value)
                    (const ,exp)
                    (reg env))))
         (make-instruction-sequence
          '(env) (list target)
          `((assign ,target
                    (op lexical-address-lookup)
                    (const ,lex-address)
                    (reg env))))))))

(define (compile-assignment exp target linkage ct-env)
  (let ((var (assignment-variable exp))
        (get-value-code
         (compile (assignment-value exp) 'val 'next ct-env)))
    (end-with-linkage
     linkage
     (preserving
      '(env)
      get-value-code
      (let ((lex-address (find-variable var ct-env)))
        (if (eq? 'not-found lex-address)
            (make-instruction-sequence
             '(env val) (list target)
             `((perform (op set-variable-value!)
                        (const ,var)
                        (reg val)
                        (reg env))
               (assign ,target (const ok))))
            (make-instruction-sequence
             '(env val) (list target)
             `((perform (op lexical-address-set!!)
                        (const ,lex-address)
                        (reg val)
                        (reg env))
               (assign ,target (const ok))))))))))

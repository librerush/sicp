#lang sicp

;; ex 5.43

(define (compile-let exp target linkage ct-env)
  (let->combination (cdr exp) target linkage ct-env))

(define (let->combination exp target linkage ct-env)
  (compile
   `((lambda
         ,(map car (car exp))
       ,@(cdr exp))
     ,@(map cadr (car exp)))
   target
   linkage
   ct-env))

(define (has-internal-define? exp)
  (if (null? exp)
      #f
      (let ((r
             (filter
              (lambda (e)
                (if (pair? e)
                    (eq? (car e) 'define)
                    #f))
              exp)))
        (not (null? r)))))

(define (compile-lambda exp target linkage ct-env)
  (let ((proc-entry (make-label 'entry))
        (after-lambda (make-label 'after-lambda)))
    (let ((lambda-linkage
           (if (eq? linkage 'next) after-lambda linkage)))
      (append-instruction-sequences
       (tack-on-instruction-sequence
        (end-with-linkage lambda-linkage
         (make-instruction-sequence '(env) (list target)
          `((assign ,target
                    (op make-compiled-procedure)
                    (label ,proc-entry)
                    (reg env)))))
        (compile-lambda-body
         (let ((formals (lambda-parameters exp)) ;; **
               (body ((lambda (body)
                        (if (has-internal-define? body)
                            (scan-out-defines body)
                            body))
                      (lambda-body exp))))
           `(lambda ,formals ,@body))
         proc-entry ct-env))
       after-lambda))))

(define (compile-lambda-body exp proc-entry ct-env)
  (let ((formals (lambda-parameters exp)))
    (append-instruction-sequences
     (make-instruction-sequence '(env proc argl) '(env)
      `(,proc-entry
        (assign env (op compiled-procedure-env) (reg proc))
        (assign env
                (op extend-environment)
                (const ,formals)
                (reg argl)
                (reg env))))
     ((if (let? (lambda-body exp)) ;; **
          compile-let
          compile-sequence)
      (lambda-body exp)
      'val
      'return
      (extend-ct-env formals ct-env)))))

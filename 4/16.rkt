#lang sicp

;; ex 4.16

(define (let-transform vars vals body)
  (cons 'let
        (cons
         (map (lambda (x) (list x '*unassigned*))
              vars)
         (append (map (lambda (x y)
                        (list 'set! x y))
                      vars
                      vals)
                 body))))

(define (scan-out-defines proc-body)
  (define (iter body defs exps)
    (cond ((null? body)
           (list defs exps))
          ((definition? (first-exp body))
           (iter (rest-exps body)
                 (cons (first-exp body) defs)
                 exps))
          (else
           (iter (rest-exps body)
                 defs
                 (cons (first-exp body) exps)))))
  (let ((defs-exps
          (map reverse (iter proc-body '() '()))))
    (let ((defs (car defs-exps))
          (exps (cadr defs-exps)))
      (let-transform
       (map (lambda (x)
              (definition-variable x)) defs)
       (map (lambda (x)
              (definition-value x)) defs)
       exps))))

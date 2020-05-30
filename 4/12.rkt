#lang sicp

;; ex 4.12

(define (enclosing-environment env) (cdr env))

(define (first-frame env) (car env))

(define the-empty-environment '())

(define (make-frame variables values)
  (cons variables values))

(define (frame-variables frame) (car frame))
(define (frame-values frame) (cdr frame))

(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons var (car frame)))
  (set-cdr! frame (cons val (cdr frame))))

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))


(define (lookup-variable-value var env)
  (traverse-env var env 'lookup-variable-value #f))

(define (set-variable-value! var val env)
  (traverse-env var env 'set-variable-value! val))

(define (define-variable! var val env)
  (traverse-env var env 'define-variable! val))

(define (traverse-env var env action val)
  (define (env-loop env)
    (define (scan vars vals frame)
      (cond ((null? vars)
             (if (eq? action 'define-variable!)
                 (add-binding-to-frame! var val frame)
                 (env-loop (enclosing-environment env))))
            ((eq? var (car vars))
             (cond ((eq? action 'lookup-variable-value)
                    (car vals))
                   ((eq? action 'set-variable-value!)
                    (set-car! vals val))
                   ((eq? action 'define-variable!)
                    (set-car! vals val))))
            (else (scan (cdr vars) (cdr vals)))))
    (if (and (not (eq? action 'define-variable!))
             (eq? env the-empty-environment))
        (error "Unbound variable" var action)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)
                frame))))
  (env-loop env))

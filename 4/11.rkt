#lang sicp

;; ex 4.11

;; changed
(define (make-frame variables values)
  (map cons variables values))

;; changed
(define (frame-variables frame) (map car frame))
(define (frame-values frame) (map cdr frame))

;; changed
(define (add-binding-to-frame! var val frame)
  (set-car! frame (cons (cons var val) (car frame))))

;; changed
(define (set-variable-value! var val env)
  (define (env-loop env)
    (define (scan vars vals frame)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var (car vars))
             ;; (set-car! vals val)
             (map (lambda (x)
                    (if (eq? (car x) var)
                        (set-cdr! x val)
                        x))
                  frame))
            (else (scan (cdr vars) (cdr vals) frame))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable -- SET!" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)
                frame))))
  (env-loop env))

;; changed
(define (define-variable! var val env)
  (let ((frame (first-frame env)))
    (define (scan vars vals)
      (cond ((null? vars)
             (add-binding-to-frame! var val frame))
            ((eq? var (car vars))
             ;; (set-car! vals val)
             (map (lambda (x)
                    (if (eq? (car x) var)
                        (set-cdr! x val)
                        x))
                  frame))
            (else (scan (cdr vars) (cdr vals)))))
    (scan (frame-variables frame)
          (frame-values frame))))

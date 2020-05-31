#lang sicp

;; ex 4.13

(#%require "mc-eval.rkt")

(define (remove-nth-element! in-list n)
  (define (iter i l)
    (cond ((= i n) (cdr l))
          (else (cons (car l)
                      (iter (+ i 1) (cdr l))))))
  (let ((new-list (iter 0 in-list)))
    (if (null? new-list)
        (begin
          (set-cdr! in-list '())
          (set-car! in-list '()))
        (begin
          (set-car! in-list (car new-list))
          (set-cdr! in-list (cdr new-list))))
    in-list))

;; Removes first occurrence of variable
(define (make-unbound! var env)
  (define (env-loop env frame-n)
    (define (scan vars vals n)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)
                       (+ 1 frame-n)))
            ((eq? var (car vars))
             (cons frame-n n))
            (else (scan (cdr vars) (cdr vals) (+ 1 n)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable -- MAKE-UNBOUND!" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)
                0))))
  (let ((refs (env-loop env 0)))
    (let ((vars (car (list-ref env (car refs)))))
      (if (< (length vars) 2)
          ;; remove entire frame
          (remove-nth-element! env (car refs))
          (begin
            ;; remove variable
            (remove-nth-element! (car (list-ref env (car refs)))
                                 (cdr refs))
            ;; remove value
            (remove-nth-element! (list-ref env (car refs))
                                 (+ 1 (cdr refs))))))))

#lang sicp

;; ex 4.20

;; a.
(define (letrec? exp)
  (tagged-list? exp 'letrec))

(define (eval-letrec exp env)
  (let ((vars (map car (cadr exp)))
        (vals (map cadr (cadr exp)))
        (body (cddr exp)))
    (let-transform vars vals body)))

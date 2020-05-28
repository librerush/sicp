#lang sicp

;; ex 4.7

(define (let*->nested-lets exp)
  (define (iter var-exp body)
    (if (null? var-exp)
        (car body)
        (let->combination
         (cons (list (car var-exp))
               (list (iter (cdr var-exp) body))))))
  (iter (cadr exp) (cddr exp)))

;; (let ((x 3))
;;   (let ((y (+ x 2)))
;;     (let ((z (+ x y 5)))
;;       (* x z))))

;; ((lambda (x)
;;    ((lambda (y)
;;       ((lambda (z)
;;          ( * x z))
;;        (+ x y 5)))
;;     (+ x 2)))
;;  3)

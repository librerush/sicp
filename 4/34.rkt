#lang sicp

;; ex 4.34

(define (cons x y)
  (list 'lazy-pair
        (lambda (m) (m x y))
        (list x y)))

(define (car z)
  ((cadr z) (lambda (p q) p)))

(define (cdr z)
  ((cadr z) (lambda (p q) q)))

(define (lazy-pair? exp)
  (tagged-list? exp 'lazy-pair))

(define (display-pair p)
  (let ((body (caddr p)))
    (let ((x (car body))
          (y (cadr body)))
      (display "(")
      (if (lazy-pair? x)
          (display-pair x)
          (display x))
      (display " . ")
      (if (lazy-pair? y)
          (display-pair y)
          (display y))
      (display ")"))))

(define (user-print object)
  (cond ((lazy-pair? object)
         (display-pair object))
        ((compound-procedure? object)
         (display (list 'compound-procedure
                        (procedure-parameters object)
                        (procedure-body object)
                        '<procedure-env>)))
        (else
         (display object))))

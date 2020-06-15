#lang sicp

;; ex 4.33

(define (datum->list datum)
  (if (null? datum)
      '()
      (cons 'cons
            (list (car datum)
                  (datum->list (cdr datum))))))

(define (text-of-quotation exp env)
  (let ((datum (cadr exp)))
    (if (pair? datum)
        (eval (datum->list datum) env)
        datum)))

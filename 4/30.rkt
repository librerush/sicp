#lang sicp

;; ex 4.30

(define for-each
  (lambda (proc items)
    (if (null? items)
        'done
        (begin (proc (car items))
               (for-each proc (cdr items))))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

;; b.
(define p1
  (lambda (x)
    (set! x (cons x '(2)))
    x))

(define p2
  (lambda (x)
    (define p
      (lambda (e) e x))
    (p (set! x (cons x '(2))))))

;;            (p1 1)   (p2 1)
;; original   (1 2)    1
;; Cy's       (1 2)    (1 2)

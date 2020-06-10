#lang sicp

;; ex 4.24

(define (pp a b)
  (display a)
  (display " ")
  (display b)
  (newline))

;; (define x (tms:utime (times)))
(pp (eval '(define f
             (lambda (x)
               (if (<= x 0)
                   1
                   (* x (f (- x 1))))))
          the-global-environment)
    "(define f ...)")

(pp
 (eval '(f 10000) the-global-environment)
 "(f ...)")

;; (pp (- (tms:utime (times)) x) "time")


;; Original version: 326
;; Improved version: 276

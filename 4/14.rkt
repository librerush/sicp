#lang sicp

;; ex 4.14

;; (#%require "mc-eval.rkt")

(define primitive-procedures
  (list (list 'car car)
        (list 'cdr cdr)
        (list 'cons cons)
        (list 'null? null?)
        (list 'map map)
        ;;      more primitives
        ))

;;; M-Eval input:
;; (map (lambda (x) (+ x 1)) '(1 2))
;; Exception: attempt to apply non-procedure (primitive #<procedure map>)

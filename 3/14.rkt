#lang sicp

;; ex 3.14

(define (mystery x)
  (define (loop x y)
    (if (null? x)
	y
	(let ((temp (cdr x)))
	  (set-cdr! x y)
	  (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(define w (mystery v))

;; mystery reverses a given list
;; after calling (mystery v):
;; v: (a)
;; w: (d c b a)

;;                    v
;;                    :
;;  . --> . --> . --> . --> /
;;  :     :     :     :
;; 'd    'c    'b    'a

#lang sicp

;; ex 3.30

(define (ripple-carry-adder a b s-out c)
  (if (null? a)
      'ok
      (let ((w (make-wire)))
	(full-adder (car a) (car b) c (car s-out) w)
	(ripple-carry-adder (cdr a) (cdr b) (cdr s-out) w))))

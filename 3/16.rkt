#lang sicp

;; ex 3.16

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
	 (count-pairs (cdr x))
	 1)))

;; (count-pairs '(a b c))
;; 3

;; (count-pairs '(a b (c)))
;; 4

;; (count-pairs '(a (b (c (d)))))
;; 7

;; (define z (make-cycle (list 'a 'b 'c)))
;; (count-pairs z)
;; *infinite recursion*

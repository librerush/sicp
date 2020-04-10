#lang sicp

;; ex 3.19

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(define (cycle-in-list? l)
  (define (iter h t)
    (cond ((eq? h t) true)
	  ((null? h) false)
	  (else (if (not (null? (cdr h)))
		    (iter (cddr h) (cdr t))
		    false))))
  (if (pair? l)
      (if (not (null? (cdr l)))
	  (iter (cddr l) (cdr l))
	  false)
      false))

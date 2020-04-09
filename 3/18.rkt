#lang sicp

;; ex 3.18

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(define (cycle-in-list? l)
  (define (iter l visited)
    (cond ((not (pair? l)) false)
	  ((member l visited) true)
       	  (else (or (iter (car l) (cons l visited))
		    (iter (cdr l) (cons l visited))))))
  (iter l '()))

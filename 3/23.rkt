#lang sicp

;; ex 3.23

(define (set-cadr! x y)
  (set-car! (cdr x) y))

(define (set-cddr! x y)
  (set-cdr! (cdr x) y))

(define (make-deque)
  ;; (front rear next-to-last)
  (cons '() (cons '() '())))

(define (front-deque deque)
  (car deque))

(define (rear-deque deque)
  (cadr deque))

(define (next-to-last deque)
  (cddr deque))

(define (empty-deque? deque)
  (null? (front-deque deque)))

(define (print-deque deque)
  (define (iter deque)
    (if (or (null? deque))
	(display ")\n")
	(begin
	  (display (front-deque deque))
	  (display " ")
	  (iter (rear-deque deque))
	  )))
  (display "( ")
  (iter (front-deque deque)))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons item (cons '() '()))))
    (cond ((empty-deque? deque)
	   (set-car! deque new-pair)
	   (set-cadr! deque new-pair))
	  (else
	   (if (eq? (front-deque deque)
		    (rear-deque deque))
	       (set-cddr! (front-deque deque) new-pair))
	   (set-cadr! new-pair (front-deque deque))
	   (set-car! deque new-pair)))
    deque))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item (cons '() '()))))
    (cond ((empty-deque? deque)
	   (set-car! deque new-pair)
	   (set-cadr! deque new-pair)
	   deque)
	  (else
	   (set-cddr! (rear-deque deque) '())
	   (set-cddr! new-pair (rear-deque deque))
	   (set-cadr! (rear-deque deque) new-pair)
	   (set-cadr! deque new-pair)
	   deque))))

(define (front-delete-deque! deque)
  (if (empty-deque? deque)
      (error "FRONT-DELETE called with an empty deque" deque)
      (begin
	(set-cddr! (front-deque deque) '())
	(set-car! deque (cadr (front-deque deque)))))
  deque)

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
	 (error "REAR-DELETE called with an empty deque" deque))
	((eq? (front-deque deque) (rear-deque deque))
	 (set-car! deque '())
	 (set-cadr! deque '())
	 (set-cddr! deque '()))
	(else
	 (set-cadr! deque (next-to-last (rear-deque deque)))
	 (set-cadr! (rear-deque deque) '())))
  deque)

;; (define q1 (make-deque))
;; (print-deque (rear-insert-deque! q1 'b))
;; (print-deque (rear-insert-deque! q1 'c))
;; (print-deque (front-insert-deque! q1 'a))
;; (print-deque (front-delete-deque! q1))
;; (print-deque (rear-delete-deque! q1))

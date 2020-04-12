#lang sicp

;; ex 3.22

(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr  '()))
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (if (empty-queue?)
	  (error "FRONT called with an empty queue"
		 (cons front-ptr rear-ptr))
	  front-ptr))
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
	(cond ((empty-queue?)
	       (set-front-ptr! new-pair)
	       (set-rear-ptr! new-pair)
	       (cons front-ptr rear-ptr))
	      (else
	       (set-cdr! rear-ptr new-pair)
	       (set-rear-ptr! new-pair)
	       (cons front-ptr rear-ptr)))))
    (define (delete-queue!)
      (cond ((empty-queue?)
	     (error "DELETE! called with an empty queue"
		    (cons front-ptr rear-ptr)))
	    (else (set-front-ptr! (cdr front-ptr))
		  (cons front-ptr rear-ptr))))
    (define (print-queue)
      (display front-ptr)
      (display "\n"))

    (define (dispatch m)
      (cond ((eq? m 'empty-queue?) (empty-queue?))
	    ((eq? m 'front-queue) (front-queue))
	    ((eq? m 'insert-queue!) insert-queue!)
	    ((eq? m 'delete-queue!) (delete-queue!))
	    ((eq? m 'print-queue) (print-queue))
	    (else (error "DISPATCH ERROR: no such operation" m))))
    dispatch))

(define (empty-queue? queue)
  (queue 'empty-queue?))

(define (front-queue queue)
  (queue 'front-queue))

(define (insert-queue! queue item)
  ((queue 'insert-queue!) item)
  queue)

(define (delete-queue! queue)
  (queue 'delete-queue!)
  queue)

(define (print-queue queue)
  (queue 'print-queue))

;; (define q1 (make-queue))
;; (print-queue (insert-queue! q1 'a))
;; (print-queue (insert-queue! q1 'b))
;; (print-queue (delete-queue! q1))
;; (print-queue (delete-queue! q1))

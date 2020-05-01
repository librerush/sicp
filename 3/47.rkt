#lang sicp

;; ex 3.47

;; a.
(define (make-semaphore n)
  (let ((count 0)
	(mutex (make-mutex)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (cond ((= count 0)
		    (set! count (+ count 1))
		    (mutex 'acquire))
		   ((< count n)
		    (set! count (+ count 1)))
		   (else (the-semaphore 'acquire))))
	    ((eq? m 'release)
	     (set! count (- count 1))
	     (if (<= count 0)
		 (mutex 'release)))))
    the-semaphore))

;; b.
(define (make-semaphore n)
  (let ((count n))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
	     (if (test-and-set! count)
		 (the-semaphore 'acquire))) ; retry
	    ((eq? m 'release) (clear! count n))))
    the-semaphore))

(define (clear! count n)
  (if (< count n)
      (set! count (+ count 1))))

(define (test-and-set! count)
  (if (<= count 0)
      true
      (begin
	(set! count (- count 1))
	false)))

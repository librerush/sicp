#lang sicp

;; ex 3.76

(#%require "streams.rkt")

(define (smooth s)
  (let ((e1 (stream-car s))
	(e2 (stream-car (stream-cdr s))))
    (cons-stream
     (/ (+ e1 e2) 2)
     (smooth (stream-cdr s)))))

(define (make-zero-crossings input-stream last-avg op)
  (let ((avgs (op input-stream)))
    (let ((avg1 (stream-car avgs)))
      (cons-stream
       (sign-change-detector avg1 last-avg)
       (make-zero-crossings
	(stream-cdr input-stream) avg1 op)))))

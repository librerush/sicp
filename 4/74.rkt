#lang sicp

;; ex 4.74

(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))

(define (simple-flatten stream)
  (stream-map car
              (stream-filter
               (lambda (s) (not (stream-null? s)))
               stream)))

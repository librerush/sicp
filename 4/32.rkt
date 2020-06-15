#lang sicp

;; ex 4.32

(#%require "../3/streams.rkt")

(define s
  (cons-stream
   12
   (cons-stream
    (/ 1 0)
    (cons-stream
     (/ 2 0)
     '()))))

(define (len stream)
  (if (stream-null? stream)
      0
      (+ 1 (len (stream-cdr stream)))))

;; (len s)
;; error: /: division by zero

(define length
  (lambda (list1)
    (if (null? list1)
        0
        (+ 1 (length (cdr list1))))))

(define lazy-list
  (cons (/ 1 0)
        (cons (/ 2 0)
              (cons (/ 3 0)
                    '()))))

;; (length lazy-list)
;; 3

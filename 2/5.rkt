#lang sicp

; ex 2.5

(define (log3 x)
  (/ (log x) (log 3)))

(define (log2 x)
  (/ (log x) (log 2)))

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (loop i)
    (let ((next (log2 (/ z (expt 3 i)))))
      (if (integer? next)
          next
          (loop (inc i)))))
  (loop 0))

(define (cdr z)
  (define (loop i)
    (let ((next (log3 (/ z (expt 2 i)))))
      (if (integer? next)
          next
          (loop (inc i)))))
  (loop 0))

; (car (cons 11 22))
; (cdr (cons 1111 2222))



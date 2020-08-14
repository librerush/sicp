#lang sicp

;; ex 5.41

(define (find-variable var ct-env)
  (define (loop frames frame-number)
    (cond ((null? frames)
           #f)
          ((eq? var (car frames))
           frame-number)
          (else (loop (cdr frames) (+ frame-number 1)))))
  (define (loop-frames ct-env frame-num)
    (if (null? ct-env)
        'not-found
        (let ((val (loop (car ct-env) 0)))
          (if val
              (make-lex-address frame-num val)
              (loop-frames (cdr ct-env) (+ frame-num 1))))))
  (loop-frames ct-env 0))

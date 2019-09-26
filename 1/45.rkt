#lang sicp

; ex 1.45

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (nth-root x n k)
  (fixed-point
    ((repeated average-damp k)
     (lambda (y) (/ x (expt y (- n 1))))) 1.0))

(define (pretty-print x i res)
  (display i)
  (display "-th root of ")
  (display x)
  (display " = ")
  (display res)
  (newline))
  
(define (test-nth-root x n k)
  (define (loop i)
    (cond ((< n i) 0)
          (else (pretty-print x i (nth-root x i k))
                (loop (inc i)))))
  (loop 2))
        
; (test-nth-root 32 5 5)


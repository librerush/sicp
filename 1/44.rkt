#lang sicp

; ex 1.44

(define dx 0.00001)

(define (average a b c)
  (/ (+ a b c) 3))

(define (f-avg f)
  (lambda (x) (average 
                (f (- x dx)) 
                (f x) 
                (f (+ x dx)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (lambda (x)
    (if (= 1 n)
        (f x)
        ((compose f (repeated f (dec n))) x))))

(define (smooth f n)
  (lambda (x) ((repeated (f-avg f) n) x)))
 
; ((smooth sin 5) 0.5)


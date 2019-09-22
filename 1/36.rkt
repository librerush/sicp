#lang sicp

; ex 1.36

(define (report-time x elapsed-time)
  (display x)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (average a b) (/ (+ a b) 2))

(define tolerance 0.0000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess start-time)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          (report-time next (- (runtime) start-time))
          (try next start-time))))
  (try first-guess (runtime)))

; (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
; (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
;             2.0))

; 4.555535740438517 *** 240
; 4.555535714310077 *** 164 


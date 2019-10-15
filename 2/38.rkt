#lang sicp

; ex 2.38

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

; (fold-right / 1 (list 1 2 3))
; (fold-left / 1 (list 1 2 3))
; (fold-right list nil (list 1 2 3))
; (fold-left list nil (list 1 2 4))

; 3/2
; 1/6
; (1 (2 (3 ())))
; (((() 1) 2) 4)

; op should be associative to guarantee that
; fold-right and fold-left will produce the same values
; for any sequence 



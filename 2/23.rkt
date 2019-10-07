#lang sicp

; ex 2.23

(define (for-each f l)
  (if (null? l)
      true
      (let ()
        (f (car l))
        (for-each f (cdr l)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))

; 57
; 321
; 88#t


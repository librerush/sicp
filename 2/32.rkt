#lang sicp

; ex 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x))
                          rest)))))

; (subsets (list 1 2 3))
; (rest (subsets (2 3)))
; (rest (subsets (3)))
; (rest (subsets ()))
; (nil)
; (append (nil) (map (lambda (x) (cons 3 x)) (nil)))
; ...

; we are combining each element with each rest subsets
; and collecting them all

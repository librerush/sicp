#lang sicp
(#%require sicp-pict)

; l - list
(define (make-frame-l origin edge1 edge2)
  (list origin edge1 edge2))

; c - cons
(define (make-frame-c origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-l frame)
  (car frame))

(define (edge1-frame-l frame)
  (cadr frame))

(define (edge2-frame-l frame)
  (caddr frame))

(define (origin-frame-c frame)
  (car frame))

(define (edge1-frame-c frame)
  (cadr frame))

(define (edge2-frame-c frame)
  (cddr frame))







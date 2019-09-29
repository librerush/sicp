#lang sicp

; ex 2.3

; First representation
; a -- b
; |    |
; d -- c

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-rec-fst a b c d)
  (cons a (cons b (cons c d))))

(define (select-a rectangle)
  (car rectangle))

(define (select-b rectangle)
  (car (cdr rectangle)))

(define (select-c rectangle)
  (car (cdr (cdr rectangle))))

(define (select-d rectangle)
  (cdr (cdr (cdr rectangle))))

(define (perimeter rectangle)
  (let ((a-b-length (- (x-point (select-b rectangle))
                       (x-point (select-a rectangle))))
        (a-d-length (- (y-point (select-a rectangle))
                       (y-point (select-d rectangle)))))
    (* 2 (+ a-b-length a-d-length))))

(define (area rectangle)
  (let ((a-b-length (- (x-point (select-b rectangle))
                       (x-point (select-a rectangle))))
        (a-d-length (- (y-point (select-a rectangle))
                       (y-point (select-d rectangle)))))
    (* a-b-length a-d-length)))

(define some-rectangle-fst
  (make-rec-fst
    (make-point 2 4)
    (make-point 10 4)
    (make-point 10 0)
    (make-point 2 0)))

; (perimeter some-rectangle-fst)
; (area some-rectangle-fst)

; Second representation
; tl -- b
; |     |
; d -- br

(define (make-rec-snd top-left bottom-right)
  (let ((b (make-point
             (x-point bottom-right)
             (y-point top-left)))
        (d (make-point
             (x-point top-left)
             (y-point bottom-right))))
    (make-rec-fst
      top-left
      b
      bottom-right
      d)))
        
(define some-rectangle-snd
  (make-rec-snd
    (make-point 2 4)
    (make-point 10 0)))

; (perimeter some-rectangle-snd)
; (area some-rectangle-snd)



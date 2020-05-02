#lang sicp

;; ex 3.51

(#%require "streams.rkt")

(define (show x)
  (display-line x)
  x)

(define x
  (stream-map show
	      (stream-enumerate-interval 0 10)))

(stream-ref x 5)
(stream-ref x 7)

;; ((0 . #<promise>))
;; 0
;; ((1 . #<promise>))
;; 1
;; ((2 . #<promise>))
;; 2
;; ((3 . #<promise>))
;; 3
;; ((4 . #<promise>))
;; 4
;; ((5 . #<promise>))
;; 5
;; 5
;; ((6 . #<promise>))
;; 6
;; ((7 . #<promise>))
;; 7
;; 7

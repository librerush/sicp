#lang sicp

;; ex 4.27

(define count 0)
(define (id x) (set! count (+ count 1)) x)

(define w (id (id 10)))

;; count
;; 1
;; +1 when outermost id is computed

;; w
;; 10
;; computes innermost id

;; count
;; 2
;; +1 when innermost id is computed

#lang sicp

;; ex 4.15

(define (run-forever) (run-forever))

(define (try p)
  (if (halts? p p) (run-forever) 'halted))

;; (try try)
;; (if (halts? try try)
;;     (run-forever)
;;     'halted)

;; If halts? returns true then program run forever
;; otherwise it will halt
;; It's a contradiction.

;; from Wikipedia:
;; For any program f that might determine if programs halt,
;; a "pathological" program g called with an input can pass
;; its own source and its input to f and then specifically
;; do the opposite of what f predicts g will do. 

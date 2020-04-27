#lang sicp

;; ex 3.40

(define x 10)
(parallel-execute (lambda () (set! x (* x x)))
		  (lambda () (set! x (* x x x))))

;; 1. 1000000: P1 sets 100, then P2 sets 1000000
;; 2. 1000000: P2 sets 1000, then P1 sets 1000000
;; 3. 10000: P1 changes x from 10 to 100 when P2 accesses
;;    x value
;; 4. 10000: P2 changes x from 10 to 1000 when P1 accesses
;;    x value
;; 5. 100: P1 accesses x, then P2 sets x to 1000,
;;    then P1 sets x
;; 6. 1000: P2 accesses x, then P1 sets x to 100,
;;    then P2 sets x

(define x 10)
(define s (make-serializer))
(parallel-execute (s (lambda () (set! x (* x x))))
		  (s (lambda () (set! x (* x x x)))))
;; Only 1 and 2 remain

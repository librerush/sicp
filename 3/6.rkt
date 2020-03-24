#lang sicp

; ex 3.6

(define (rand-update x)
  (let ((m (expt 2 31))
        (a 1103515245)
        (b 12345))
    (remainder (+ (* a x) b) m)))

(define rand
  (let ((x 42))
    (lambda (action)
      (cond ((eq? action 'generate)
             (set! x (rand-update x))
             x)
            ((eq? action 'reset)
             (lambda (new-x)
               (set! x new-x)))
            (else (error "NO SUCH ACTION -- RAND" action))))))

;; (rand 'generate)
;; (rand 'generate)
;; (rand 'generate)
;; ((rand 'reset) 10)
;; (rand 'generate)
;; ((rand 'reset) 42)
;; (rand 'generate)

#lang sicp

; ex 1.37

(define (cont-frac n d k)
  (define (loop i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (loop (inc i))))))
  (loop 1.0))

(define (cont-frac-iter n d k)
  (define iter
    (lambda (i result)
      (let ((nk (n i))
            (dk (d i)))
        (if (= i 0)
            result
            (iter (dec i) (/ nk (+ dk result)))))))
  (iter k 0))

; How large must you make
; k in order to get an approximation that is accurate to
; 4 decimal places?
; when k = 12

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            12)

; 0.6180257510729613 

; (cont-frac-iter (lambda (i) 1.0)
;                 (lambda (i) 1.0)
;                 12)


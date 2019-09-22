#lang sicp

; ex 1.37

(define (cont-frac n d k)
  (let ((nk (n k))
        (dk (d k)))
    (cond ((= k 1) (/ nk dk))
          (else (/ nk (+ dk (cont-frac n d (- k 1))))))))

(define (cont-frac-iter n d k)
  (define iter
    (lambda (i result)
      (let ((nk (n k))
            (dk (d k)))
        (if (= i 1)
            result
            (iter (dec i) (/ nk (+ dk result)))))))
  (iter k (/ (n k) (d k))))

; How large must you make
; k in order to get an approximation that is accurate to
; 4 decimal places?
; when k = 12

; (cont-frac (lambda (i) 1.0)
;            (lambda (i) 1.0)
;            12)))

; 0.6180257510729613 

; (cont-frac-iter (lambda (i) 1.0)
;                 (lambda (i) 1.0)
;                 12)))



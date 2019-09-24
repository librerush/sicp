#lang sicp

; ex 1.38

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

(define (e-value k)
  (+ 2.0 (cont-frac
           (lambda (i) 1.0)
           (lambda (i)
              (if (= (remainder i 3) 2)
                  (/ (+ i 1) 1.5)
                  1.0))
           k)))

; (e-value 22)
; 2.7182818284590455



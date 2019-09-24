#lang sicp

; ex 1.39

(define square (lambda (x) (* x x)))

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

(define (tan-cf x k)
  (cont-frac-iter (lambda (i)
                    (if (= 1.0 i)
                        x
                        (- (square x))))
                  (lambda (i) (+ i (- i 1)))
                  k))

; (tan-cf 3.14 25)
; -0.0015926549364072742


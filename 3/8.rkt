#lang sicp

; ex 3.8

(define f
  (let ((previous -1))
    (lambda (x)
      (cond ((= previous -1)
             (set! previous x)
             x)
            ((= previous 0)
             (set! previous x)
             0)
            (else (set! previous x)
                  x)))))

;; (+ (f 0) (f 1))

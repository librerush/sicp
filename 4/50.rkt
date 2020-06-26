#lang sicp

;; ex 4.50

(define (analyze-ramb exp)
  (let ((cprocs (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            (let ((n (random (length choices))))
              (define (rm-nth i l)
                (if (= i n)
                    (cdr l)
                    (cons (car l)
                          (rm-nth (+ i 1) (cdr l)))))
              ((list-ref choices n)
               env
               succeed
               (lambda ()
                 (try-next (rm-nth 0 choices)))))))
      (try-next cprocs))))

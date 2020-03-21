#lang sicp

; ex 3.2

(define (make-monitored f)
  (define count 0)

  (define (mf arg)
    (cond ((eq? arg 'how-many-call?) count)
          ((eq? arg 'reset-count) (set! count 0)
                                  count)
          (else (set! count (+ count 1))
                (f arg))))
  mf)

(define s (make-monitored sqrt))

(s 100)
(s 10)
(s 'how-many-call?)

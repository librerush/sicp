#lang sicp

;; ex 4.75

(define (uniquely-asserted contents frame-stream)
  (stream-flatmap
   (lambda (frame)
     (let ((evaled (qeval (negated-query contents)
                          (singleton-stream frame))))
       (if (and (not (stream-null? evaled))
                (stream-null? (stream-cdr evaled)))
           evaled
           the-empty-stream)))
   frame-stream))

#lang sicp

;; ex 4.41

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

;; Horrible solution
(define (multiple-dwelling)
  (define floors (list 1 2 3 4 5))
  (define (loop)
    (for-each
     (lambda (baker)
       (if (not (= baker 5))
           (for-each
            (lambda (cooper)
              (if (not (= cooper 1))
                  (for-each
                   (lambda (miller)
                     (if (> miller cooper)
                         (for-each
                          (lambda (fletcher)
                            (if (and (not (= fletcher 1))
                                     (not (= fletcher 5)))
                                (for-each
                                 (lambda (smith)
                                   (if (and
                                        (not (= (abs (- smith fletcher)) 1))
                                        (not (= (abs (- fletcher cooper)) 1))
                                        (distinct?
                                         (list baker cooper miller fletcher smith)))
                                       (begin
                                         (display
                                          (list (list 'baker baker) (list 'cooper cooper)
                                                (list 'fletcher fletcher) (list 'miller miller)
                                                (list 'smith smith)))
                                         (newline))))
                                 floors)))
                          floors)))
                   floors)))
            floors)))
     floors))
  (loop))

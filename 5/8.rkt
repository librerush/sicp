#lang sicp

;; ex 5.8

(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels
       (cdr text)
       (lambda (insts labels)
         (let ((next-inst (car text)))
           (if (symbol? next-inst)
               ((lambda (insts-2 labels-2)
                  (let ((location (assoc next-inst labels)))
                    (if location
                        (error "Already used label" next-inst)
                        (receive insts-2 labels-2))))
                insts
                (cons (make-label-entry next-inst
                                        insts)
                      labels))
               (receive (cons (make-instruction next-inst)
                              insts)
                   labels)))))))

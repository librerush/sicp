#lang sicp

;; ex 5.11

;; a.

;; b.
(define (make-save inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (cons (stack-inst-reg-name inst)
                        (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (let ((s (pop stack)))
        (if (eq? (stack-inst-reg-name inst)
                 (car s))
            (begin
              (set-contents! reg (cdr s))
              (advance-pc pc))
            (error "Not the same register -- RESTORE" (car s)))))))

;; c.

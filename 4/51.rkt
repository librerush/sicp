#lang sicp

;; ex 4.51

(define (permanent-set? exp)
  (tagged-list? exp 'permanent-set!))

(define (analyze-perm-set exp)
  (let ((var (assignment-variable exp))
        (vproc (analyze (assignment-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)
                 (set-variable-value! var val env)
                 (succeed 'ok
                          (lambda ()
                            (fail2))))
             fail))))

;; If we use set! count variable always be 1.

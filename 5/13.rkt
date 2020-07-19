#lang sicp

;; ex 5.13

;; Simple and inefficient solution.

(define (make-machine ops controller-text)
  (let ((machine (make-new-machine)))
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '()))
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))
                 ;;**next for monitored stack (as in section 5.2.4)
                 ;;  -- comment out if not wanted
                 (list 'print-stack-statistics
                       (lambda () (stack 'print-statistics)))))
          (register-table
           (list (list 'pc pc) (list 'flag flag))))
      (define (allocate-register name)
        (if (assoc name register-table)
            (error "Multiply defined register: " name)
            (set! register-table
                  (cons (list name (make-register name))
                        register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))
      ;; changed
      (define (allocated-register? name)
        (let ((val (assoc name register-table)))
          (if val true false)))
      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
              'done
              (begin
                ((instruction-execution-proc (car insts)))
                (execute)))))
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'allocate-register) allocate-register)
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ;; changed
              ((eq? message 'allocated-register?) allocated-register?)
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define (allocate-register machine name)
  (if (not ((machine 'allocated-register?)
            name))
      ((machine 'allocate-register)
       name)))

(define (make-assign inst machine labels operations pc)
  ;; changed
  (allocate-register machine (assign-reg-name inst))
  (let ((target
         (get-register machine (assign-reg-name inst)))
        (value-exp (assign-value-exp inst)))
    (let ((value-proc
           (if (operation-exp? value-exp)
               (make-operation-exp
                value-exp machine labels operations)
               (make-primitive-exp
                (car value-exp) machine labels))))
      (lambda ()                ; execution procedure for assign
        (set-contents! target (value-proc))
        (advance-pc pc)))))

(define (make-goto inst machine labels pc)
  (let ((dest (goto-dest inst)))
    (cond ((label-exp? dest)
           (let ((insts
                  (lookup-label labels
                                (label-exp-label dest))))
             (lambda () (set-contents! pc insts))))
          ((register-exp? dest)
           ;; changed
           (allocate-register machine (register-exp-reg dest))
           (let ((reg
                  (get-register machine
                                (register-exp-reg dest))))
             (lambda ()
               (set-contents! pc (get-contents reg)))))
          (else (error "Bad GOTO instruction -- ASSEMBLE"
                       inst)))))

(define (make-save inst machine stack pc)
  ;; changed
  (allocate-register machine (stack-inst-reg-name inst))
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (cons (stack-inst-reg-name inst)
                        (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  ;; changed
  (allocate-register machine (stack-inst-reg-name inst))
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      ;; (set-contents! reg (pop stack))
      (let ((s (pop stack)))
        (if (eq? (stack-inst-reg-name inst)
                 (car s))
            (begin
              (set-contents! reg (cdr s))
              (advance-pc pc))
            (error "Not the same register -- RESTORE" (car s)))))))

(define (make-primitive-exp exp machine labels)
  (cond ((constant-exp? exp)
         (let ((c (constant-exp-value exp)))
           (lambda () c)))
        ((label-exp? exp)
         (let ((insts
                (lookup-label labels
                              (label-exp-label exp))))
           (lambda () insts)))
        ((register-exp? exp)
         ;; changed
         (allocate-register machine (register-exp-reg exp))
         (let ((r (get-register machine
                                (register-exp-reg exp))))
           (lambda () (get-contents r))))
        (else
         (error "Unknown expression type -- ASSEMBLE" exp))))

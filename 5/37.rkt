#lang sicp

;; ex 5.37

(compile '(define f (g x y)) 'val 'next)

((continue env)
 (proc argl val)
 ((save continue) ;; c0
  (save env)
  (save continue) ;; c1
  (save env) ;; e1
  (save continue) ;; c2
  (assign proc (op lookup-variable-value) (const g) (reg env))
  (restore continue) ;; c2
  (restore env) ;; e1
  (restore continue) ;; c1
  (save continue) ;; c3
  (save proc) ;; p1
  (save env) ;; e2
  (save continue) ;; c4
  (assign val (op lookup-variable-value) (const y) (reg env))
  (restore continue) ;; c4
  (assign argl (op list) (reg val))
  (restore env) ;; e2
  (save argl) ;; a1
  (save continue) ;; c5
  (assign val (op lookup-variable-value) (const x) (reg env))
  (restore continue) ;; c5
  (restore argl) ;; a1
  (assign argl (op cons) (reg val) (reg argl))
  (restore proc) ;; p1
  (restore continue) ;; c3
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1))
  compiled-branch2
  (assign continue (label after-call3))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch1
  (save continue) ;; c6
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  (restore continue) ;; c6
  after-call3
  (restore env)
  (perform (op define-variable!) (const f) (reg val) (reg env))
  (assign val (const ok))
  (restore continue))) ;; c0


((env)
 (proc argl continue val)
 ((save env)
  (assign proc (op lookup-variable-value) (const g) (reg env))
  (assign val (op lookup-variable-value) (const y) (reg env))
  (assign argl (op list) (reg val))
  (assign val (op lookup-variable-value) (const x) (reg env))
  (assign argl (op cons) (reg val) (reg argl))
  (test (op primitive-procedure?) (reg proc))
  (branch (label primitive-branch1))
  compiled-branch2
  (assign continue (label after-call3))
  (assign val (op compiled-procedure-entry) (reg proc))
  (goto (reg val))
  primitive-branch1
  (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
  after-call3
  (restore env)
  (perform (op define-variable!) (const f) (reg val) (reg env))
  (assign val (const ok))))

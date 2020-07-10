#lang sicp

;; ex 5.2

(controller
 (assign product 1)
 (assign counter 1)
 test-counter
 (test (op >) (reg counter) (reg n))
 (branch (label factorial-done))
 (assign product (op *) (reg counter) (reg product))
 (assign counter (op +) (reg counter) (const 1))
 (goto (label test-counter))
 factorial-done)

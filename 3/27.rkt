#lang sicp

;; ex 3.27

;; memo-fib stores every Fibonacci number between 0..n in the table
;; so we can reuse previously computed values.


;; (memoize fib) is not the same as memo-fib.
;; ((memoize fib) n) generates tree recursion, and stores only
;; n-th Fibonacci number.

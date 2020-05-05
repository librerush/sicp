#lang sicp

;; ex 3.57

;; O(n) (with memo-proc procedure)
;;             fib 5
;;            /     \
;;         fib 4    fib 3
;;           /      /    \
;;         ***    fib 2  fib 1
;;                ***    ***
;;                            

;; (without memo-proc procedure)
;;                       fib 5
;;             /                      \
;;         fib 4                      fib 3
;;         /    \                    /     \
;;      fib 3  fib 2               fib 2  fib 1
;;      /   \     /  \              /  \
;;  fib 2  fib 1 fib 1 fib 0     fib 1 fib 0        
;;  /   \
;; fib 1 fib 0

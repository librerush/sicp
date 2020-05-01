#lang sicp

;; ex 3.46


;; Suppose we have two processes A and B.

;;      A                         B
;;      |                         |
;;  access cell                   |
;;      |                     access cell
;;  set! cell to true             |
;;      |                     set! cell to true
;;  return false                  |
;;                            return false

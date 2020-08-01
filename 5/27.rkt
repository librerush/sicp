#lang sicp

;; ex 5.27

;; The maximum depth:
;; f(n) = 5 * (n - 1) + 8

;; The total number of pushes:
;; f(n) = 32 * (n - 1) + 16

#|
            Max depth        |  Number of pushes

Recursive   for any n, 10    |  35 * (n - 1) + 64
factorial                    |
                             |
Iterative   5 * (n - 1) + 8  |  32 * (n - 1) + 16
factorial

|#

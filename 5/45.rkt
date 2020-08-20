#lang sicp

;; ex 5.45

;; a.
#|
Compiled / Interpreted ->
Number of pushes:
(6 * n + 1) / (32 * (n - 1) + 16) =
(3 * n + 1/2) / (16 * n - 8)

Max depth:
(3 * n - 1) / (5 * (n - 1) + 8) =
(3 * n - 1) / (5 * n - 3)

Special-purpose / Interpreted ->
Number of pushes:
(2 * (n - 1)) / (32 * (n - 1) + 16) =
(n - 1) / (16 * (n - 1) + 8) 

Max depth:
(2 * (n - 1)) / (5 * (n - 1) + 8)
|#

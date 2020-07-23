#lang sicp

;; ex 5.20

(define x (cons 1 2))
(define y (list x x))

#|       | 0 | 1  | 2  | 3  | 4 |
the-cars |   | n1 | p1 | p1 |   |
the-cdrs |   | n2 | p3 | e0 |   |

The final value of free is p4.
|#

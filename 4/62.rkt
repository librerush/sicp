#lang sicp

;; ex 4.62

(rule (last-pair (?x) (?x)))
(rule (last-pair (?x . ?y) ?z)
      (last-pair ?y ?z))

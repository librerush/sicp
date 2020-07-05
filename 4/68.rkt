#lang sicp

;; ex 4.68

(rule (reverse () ()))
(rule (reverse (?l . ?ls) ?r)
      (and (reverse ?ls ?z)
           (append-to-form ?z (?l) ?r)))

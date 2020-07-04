#lang sicp

;; ex 4.64

(rule (outranked-by ?staff-person ?boss)
      (or (supervisor ?staff-person ?boss)
          (and (outranked-by ?middle-manager ?boss) ; middle-manager is unbound here
               (supervisor ?staff-person ?middle-manager))))

(outranked-by (Bitdiddle Ben) ?who)

;; It's a left recursion.

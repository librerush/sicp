#lang sicp

;; ex 4.63

(rule (son ?m ?s)
      (and (wife ?m ?w)
           (son ?w ?s)))

(rule (grandson ?g ?s)
      (and (son ?f ?s)
           (son ?g ?f)))

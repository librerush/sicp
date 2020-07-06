#lang sicp

;; ex 4.69

(rule (ggrandson (grandson) ?g ?ggs)
      (grandson ?g ?ggs))
(rule (ggrandson (great . ?rel) ?g ?ggs)
      (and (son ?f ?ggs)
           (ggrandson ?rel ?g ?f)))

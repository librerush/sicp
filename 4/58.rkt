#lang sicp

;; ex 4.58

(rule (big-shot ?person ?division)
      (or (not (supervisor ?person ?boss))
          (and (job ?person (?division . ?rest))
               (supervisor ?person ?boss)
               (not (job ?boss (?division  . ?rest2))))))

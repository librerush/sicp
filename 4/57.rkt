#lang sicp

;; ex 4.57

(rule (can-replace ?person-1 ?person-2)
      (and (job ?person-1 ?job-1)
           (or (job ?person-2 ?job-1)
               (and (job ?person-2 ?job-2)
                    (can-do-job ?job-1 ?job-2)))
           (not (same ?person-1 ?person-2))))
;; a.
(can-replace ?person (Fect Cy D))

;; b.
(and (can-replace ?person-1 ?person-2)
     (salary ?person-1 ?amount-1)
     (salary ?person-2 ?amount-2)
     (lisp-value < ?amount-1 ?amount-2))

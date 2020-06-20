#lang sicp

;; ex 4.43

(define (require p)
  (if (not p)
      (amb)))

(define (distinct? items)
  (cond ((null? items) true)
        ((null? (cdr items)) true)
        ((member (car items) (cdr items)) false)
        (else (distinct? (cdr items)))))

(define (father-yacht? father yacht)
  (if (member
       (list father yacht)
       (list (list 'barnacle 'gabrielle)
             (list 'moore 'lorna)
             (list 'hall 'rosalind)
             (list 'downing 'melissa)
             (list 'parker 'mary)))
      #t
      #f))

(define (lornas-father)
  (let ((melissa 'barnacle)
        (gabrielle (amb 'moore 'hall 'downing))
        (rosalind (amb 'moore 'hall 'downing 'parker))
        ;; (mary (amb 'moore 'hall 'downing 'parker))
        (mary 'moore)
        (lorna (amb 'moore 'hall 'downing 'parker)))
    (require (or (father-yacht? gabrielle 'rosalind)
                 (father-yacht? gabrielle 'mary)
                 (father-yacht? gabrielle 'lorna)))
    (require
     (distinct? (list gabrielle rosalind mary lorna)))
    (list (list 'melissa melissa)
          (list 'gabrielle gabrielle)
          (list 'rosalind rosalind)
          (list 'mary mary)
          (list 'lorna lorna))))

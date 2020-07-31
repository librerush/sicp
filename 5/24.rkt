#lang sicp

;; ex 5.24

;; buggy implementation

'(ev-cond
  (save env)
  (save exp)
  (save continue)
  (assign unev (op cond-clauses) (reg exp))
ev-cond-loop
  (test (op null?) (reg unev))
  (branch (label ev-cond-null))
  (assign exp (op first-cond-predicate) (reg unev))
  (assign continue (label ev-cond-loop-1))
  (goto (label eval-dispatch))
ev-cond-loop-1
  (test (op true?) (reg val))
  (branch (label ev-cond-loop-2))
  (assign unev (op cdr) (reg unev))
  (goto (label ev-cond-loop))
ev-cond-loop-2
  (perform (op display) (reg unev))
  (assign unev (op first-cond-actions) (reg unev))
  (restore continue)
  (restore exp)
  (restore env)
  (save continue)
  (goto (label ev-sequence))
ev-cond-null
  (restore continue)
  (restore exp)
  (restore env)
  (assign val (const false))
  (goto (reg continue)))

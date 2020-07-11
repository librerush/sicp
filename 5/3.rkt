#lang sicp

;; ex 5.3

'(controller
  (assign guess (const 1.0))
  sqrt-iter
  (test (op good-enough?) (reg guess))
  (branch (label sqrt-iter-done))
  (assign t (op improve) (reg guess))
  (assign guess (reg t))
  (goto (label sqrt-iter))
  sqrt-iter-done)

'(controller
  (assign guess (conts 1.0))
  good-enough-loop
  (assign sq (op square) (reg guess))
  (assign sub (op -) (reg sq) (reg x))
  (assign absr (op abs) (reg sub))
  (test (op <) (reg absr) (const 0.001))
  (branch (label sqrt-done))
  (assign d (op /) (reg x) (reg guess))
  (assign a (op average) (reg guess) (reg d))
  (assign guess (reg a))
  (goto (label good-enough-loop))
  sqrt-done)

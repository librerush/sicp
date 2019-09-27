#lang sicp

; ex 1.13

; Fib(n) = Fib(n - 1) + Fib(n - 2)
; Fib(0) = 0
; Fib(1) = 1

; phi = (1 + sqrt(5)) / 2
; psi = (1 - sqrt(5)) / 2

; need to prove Fib(n) = (phi ^ n - psi ^ n) / sqrt(5)

; base case
; Fib(0) = (phi ^ 0 - psi ^ 0) / sqrt(5)
; => (1 - 1) / sqrt(5)
; => 0
;
; Fib(1) = (phi ^ 1 - psi ^ 1) / sqrt(5)
; => (2 * sqrt(5)) / (2 * sqrt(5))
; => 1

; 
; Fib(n) = (phi ^ (n - 1) - psi ^ (n - 1)) / sqrt(5)
; => + (phi ^ (n - 2) - psi ^ (n - 2)) / sqrt(5)


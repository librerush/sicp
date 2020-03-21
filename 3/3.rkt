#lang sicp

; ex 3.3

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (lambda (in-password action)
    (if (eq? password in-password)
        (cond ((eq? action 'withdraw) withdraw)
              ((eq? action 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT")))
        (lambda (x) "Incorrect password"))))


(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)

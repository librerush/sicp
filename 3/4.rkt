#lang sicp

; ex 3.3

(define (make-account balance password)
  (define (call-the-cops) "Calling the cops")
  (define attempts 0)
  (define (withdraw amount)
    (set! attempts 0)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! attempts 0)
    (set! balance (+ balance amount))
    balance)
  (lambda (in-password action)
    (if (eq? password in-password)
        (cond ((eq? action 'withdraw) withdraw)
              ((eq? action 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT")))
        (lambda (x) (if (>= attempts 7)
                        (call-the-cops)
                        (begin
                          (set! attempts (+ attempts 1))
                          "Incorrect password"))))))


(define acc (make-account 100 'secret-password))

((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)

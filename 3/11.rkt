#lang sicp

; ex 3.11

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)

(define acc (make-account 50))
((acc 'deposit) 40)
((acc 'withdraw) 60)

(define acc2 (make-account 100))

;; global env -->   make-account: ...
;;                  acc: --------------------------------
;;                  acc2:                               |
;;                   |                                  |
;;                   v                                  v
;;                   E1 -> balance: 100                 E2 -> balance: 50
;;                         withdraw: ---->  .... <---------- withdraw:
;;                         deposit: ----->  .... <---------- deposit:
;;                         dispatch: ---->  .... <---------- dispatch:

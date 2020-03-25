#lang sicp

; ex 3.7

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define fork-password 'empty)
  (define (fork passwd)
    (set! fork-password passwd)
    dispatch)
  ;; wrap into dispatch procedure
  (define (dispatch in-password action)
    (if (or (eq? password in-password) (eq? fork-password in-password))
        (cond ((eq? action 'withdraw) withdraw)
              ((eq? action 'deposit) deposit)
              ((eq? action 'fork) fork)
              ((eq? action 'balance) balance)
              (else (error "Unknown request: MAKE-ACCOUNT")))
        (lambda (x)
          "Incorrect password")))
  dispatch)

(define (make-joint account password new-password)
  ((account password 'fork) new-password))

(define peter-acc (make-account 100 'open-sesame))
(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))


;; (peter-acc 'open-sesame 'balance)
;; (paul-acc 'rosebud 'balance)
;; ((paul-acc 'rosebud 'deposit) 5)
;; (peter-acc 'open-sesame 'balance)
;; ((peter-acc 'open-sesame 'withdraw) 100)
;; (paul-acc 'rosebud 'balance)

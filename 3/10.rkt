#lang sicp

; ex 3.10

(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

(define W1 (make-withdraw 100))
(W1 50)
(define W2 (make-withdraw 100))


;; global env --> W1                              W2
;;                |      |                        |      |
;;                |      E1 initial-amount: 100   |      E3 initial-amount: 100
;;                |      |                        |      |
;;                .. --> E2 balance: 50           .. --> E4 balance: 100
;;                |                               |
;;                v                               |
;;                parameters: amount <------------.
;;                body: ...

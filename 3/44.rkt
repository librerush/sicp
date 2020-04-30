#lang sicp

;; ex 3.44

(define (transfer from-account to-account amount)
  ((from-account 'withdraw) amount)
  ((to-account 'deposit) amount))

;; Ben is right. Here we don't have access to balance,
;; so this method is safe. 

#lang sicp

;; ex 3.36

(#%require "constraints.rkt")

(define a (make-connector))
(define b (make-connector))
(set-value! a 10 'user)

;; global env --> ( a  b ...)
;;                  :
;;                make-connector
;;                  :
;;                set-my-value
;;                  :
;;                value: 10
;;                informant: 'user
;;                constraints: '()
;;                  :
;;                (for-each-except 'user inform-about-value constraints)
;;                  :
;;                'done

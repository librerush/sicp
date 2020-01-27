#lang racket

; ex 2.71

;;                    (a b c d e) 31
;;                   /           \
;;                (a b c d) 15    e 16
;;                 /     \
;;            (a b c) 7   d 8
;;             /    \
;;         (a b) 3   c 4
;;         /   \
;;      a 1    b 2

;; a. 1 bit for the most frequent symbol
;; b. n bits for the least frequent symbol

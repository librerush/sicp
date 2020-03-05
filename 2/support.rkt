#lang racket

(provide nil)
(provide get)
(provide put)
(provide true)
(provide false)

(define true #t)
(define false #f)

;;; ***not in book, but needed for code before quote is introduced***
(define nil '())

;;;-----------
;;;from section 3.3.3 for section 2.4.3
;;; to support operation/type table for data-directed dispatch

;; https://stackoverflow.com/a/5499256
(define global-array '())

(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list(make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! global-array (put-helper (list op type) global-array)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) global-array))

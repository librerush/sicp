#lang sicp

;; ex 3.74

(#%require "streams.rkt")

(define zero-crossings
  (stream-map sign-change-detector
	      sense-data
	      (cons-stream 0 (stream-cdr sense-data))))

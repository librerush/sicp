#lang sicp

; ex 1.23

(define (square x)
  (* x x))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (next n)
  (if (= n 2) 3 (+ 2 n)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
; (newline)
; (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n) 0))

(define (report-prime elapsed-time n)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  1)

(define (search-for-primes larger-than)
  (if (odd? larger-than)
      (search-iter (+ 2 larger-than) 0)
      (search-iter (+ 1 larger-than) 0)))

(define (search-iter larger-than n-primes)
  (cond ((= n-primes 3) 0)
        (else
          (search-iter (+ 2 larger-than)
                       (+ n-primes (timed-prime-test larger-than))))))

; (search-for-primes 1000)
; (search-for-primes 10000)
; (search-for-primes 100000)
; (search-for-primes 1000000)

; 1009 *** 0
; 1013 *** 2
; 1019 *** 0

; 10007 *** 1
; 10009 *** 1
; 10037 *** 2

; 100003 *** 4
; 100019 *** 4
; 100043 *** 4

; 1000003 *** 15
; 1000033 *** 17
; 1000037 *** 14

; runtime ratio of (/ old new) algorithms ~= 1.47
; (/ (+ (/ 23 15) (/ 21 17) (/ 23 14)) 3.0)



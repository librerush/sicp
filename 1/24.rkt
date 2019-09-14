#lang sicp

; ex 1.24

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
; (newline)
; (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
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

; when n = 1000000, log(n) ~ 20
; when n = 1000,    log(n) ~ 10 

; 1009 *** 260
; 1013 *** 7
; 1019 *** 6

; 10007 *** 7
; 10009 *** 6
; 10037 *** 7

; 100003 *** 9
; 100019 *** 7
; 100043 *** 7

; 1000003 *** 8
; 1000033 *** 8
; 1000037 *** 8


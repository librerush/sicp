#lang sicp

; ex 1.33

(define (filtered-accumulate predicate? combiner null-value term a next b)
  (define (iter x result)
    (if (> x b)
        result
        (if (predicate? x)
            (iter (next x) (combiner result (term x)))
            (iter (next x) result))))
  (iter a null-value))

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

(define (prime? n)
  (fast-prime? n 7))

(define (sum-of-square-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (relative-prime? n i)
  (= (gcd i n) 1))

(define (product-of-ints n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc (- n 1)))

; (product-of-ints 10)
; (sum-of-square-primes 5 11)


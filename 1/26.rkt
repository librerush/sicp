#lang sicp

; ex 1.26

(define (expmod-by-louis base exp m)
  (cond ((= exp 0) (ppExp base exp m) 1)
        ((even? exp)
         (ppExp base exp m) 
         (remainder (* (expmod-by-louis base (/ exp 2) m)
                       (expmod-by-louis base (/ exp 2) m))
                    m))
        (else
          (ppExp base exp m) 
          (remainder (* base
                        (expmod-by-louis base (- exp 1) m))
                     m))))

(define (square x)
  (* x x))

; pretty printer
(define (ppExp base exp m)
  (display "(expmod ")
  (display base)
  (display " ")
  (display exp)
  (display " ")
  (display m)
  (display ") ")
  (newline))

(define (expmod base exp m)
  (cond ((= exp 0) (ppExp base exp m) 1)
        ((even? exp)
         (ppExp base exp m)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (ppExp base exp m)
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

; (expmod-by-louis 13 2 7)
; (expmod 13 2 7)

; (expmod 13 2 7) 
; (expmod 13 1 7) 
; (expmod 13 0 7) 
; (expmod 13 1 7) 
; (expmod 13 0 7) 
; 1

; (expmod 13 2 7) 
; (expmod 13 1 7) 
; (expmod 13 0 7) 
; 1

; Louis's code every time calls (expmod base (/ exp 2) m) twice
; when exp is even



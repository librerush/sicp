#lang sicp

; ex 2.55

(car ''abracadabra)
; quote

; which is the same as
(car '(quote abracadabra))
; or
(car (quote (quote abracadabra)))
; (list 'car (list 'quote (list 'quote 'abracadabra))) 


